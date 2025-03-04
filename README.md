# About
This is the RSE Skills Graph web app written in Python 3 with the Flask framework. Original code by Steve Pettifer; mods by Ian Cottam, Colin Morris, Ian Hinder; The University of Manchester; Apache 2 Licence

# How to Use
There is an existing deployment hosted [here](https://rseskillsgraph.itservices.manchester.ac.uk/). You can click on RSEs' names and see their skills, as well as search by skill. The data source for the skills graph is [CapX](https://balex.itservices.manchester.ac.uk). The use of its API requires an API key that must be set as an environment variable called `CAPX_API_KEY` for the retreival of the data to succeed.

# How to Add / Update
To add or update a person's entry, simply modify their associated skills in CapX and the graph will automatically update the next time it loads.

Managers have the ability to add new skill options as necessary and where possible, the skills tags will link to a Wikipedia main article through their controlled name.

# How to Install / Run
The `requirements.txt` should contain the Python modules needed.

You also need to install the C-based GraphViz library: e.g. `brew install graphviz` (MacOS)

To run locally: `flask run`

## Docker
There is a Dockerfile within the repository from which a docker image can be built and run.  See [Running in Docker](doc/RunningInDocker.md).

There is an instance of this software running at the University of Manchester on a Research Virtual Machine.

There is documentation for running in Microsoft Azure: [Running in Docker on Azure](doc/RunningOnAzureWithDocker.md).

# Headshots
Portrait images of people can be included in an images directory, but we don't use that faclity at the moment.

## Possible Improvements
- [ ] A self-service web-frontend for editing the files
