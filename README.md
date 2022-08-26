# About
This is the RSE Skills Graph web app written in Python 3 with the Flask framework. Original code by Steve Pettifer; mods by Ian Cottam, Colin Morris, Ian Hinder; The University of Manchester; Apache 2 Licence

# How to Add / Update
To add or update a person's entry, modify the JSON entry in `people.json`. People with spaces in their surname should use underscore e.g. Le_Blanc.
It will be displayed properly with a space. The "interests" for each person need to come from Wikipedia main entries - that is our controlled vocabulary.

The JSON is fairly obvious. There are two levels, called "interests" and "technologies". Interests are clickable, but technologies not. Some browsers let you right-click a technology and look up its definition. In the RSE-skills application we really just use Interests, so everything is clickable. We do use technologies sparingly as commentary.

# How to Install / Run
The `requirements.txt` should contain the Python modules needed.

You also need to install the C-based GraphViz library: e.g. `brew install graphviz`

To run locally: `python application.py` (where `python` must be Python 3)

We have this running on Azure now as a Docker container and it is published automatically from this repository. To run in Docker, see [Running in Docker](doc/RunningInDocker.md). To run in Docker on Microsoft Azure, see [Running in Docker on Azure](doc/RunningOnAzureWithDocker.md).

# Headshots
Portrait images of people can be included in an images directory, but we don't use that faclity at the moment.

## Possible Improvements
- [ ] A self-service web-frontend for editing the files
