#!/usr/bin/env python

import application

# This test should be run against the capxmock service
def test_get_people():
    people_result = {'Person A': {'interests': ['Skill 1', 'Skill 2']}, 'Person B': {'interests': ['Skill 3']}}
    people = application.get_people()
    assert(people == people_result)
