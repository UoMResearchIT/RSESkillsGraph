#!/usr/bin/env python

import application


def test_titles_are_wikipedia_articles():
    """Ensure that all topics listed in the people file are the titles
    of Wikipedia articles, which is our controlled vocabulary.
    """

    people = application.get_people()
    all_topics = sorted(list(set([topic for persondata in people.values()
                                  for topic in persondata["interests"]])))
    invalid_titles = []
    canonicalised_titles = []

    print("Checking titles are Wikipedia articles:")
    print()

    people_with_this_topic = {}

    for topic in all_topics:
        print(f"Checking {topic}")
        try:
            # TODO: we shoulds probably do this in batches to reduce
            # the number of queries to wikipedia, and speed it up
            canonical_title = application.canonical_title(topic)
            if canonical_title != topic:
                print(f"  ➡️ Should be {canonical_title}")
        except application.TitleNotFoundException:
            people_with_this_topic[topic] = [person for person in people.keys() if topic in people[person]["interests"]]
            print(f"  ❌ Invalid ({', '.join(people_with_this_topic[topic])})")
            invalid_titles += [topic]
            continue

        if canonical_title != topic:
            canonicalised_titles += [(topic, canonical_title)]

    print()

    print("Invalid titles:")
    for topic in invalid_titles:
        print(f"  {topic} ({', '.join(people_with_this_topic[topic])})")
    print()

    print("Canonicalised titles:")
    for topic, canonicalised in canonicalised_titles:
        print(f"  {topic} -> {canonicalised}")

    print()

    assert(len(invalid_titles+canonicalised_titles) == 0)
