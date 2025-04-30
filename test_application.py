#!/usr/bin/env python

import application
import os
import requests
import json
import pytest_mock
from pprint import pprint

# This test should be run against the capxmock service
def test_get_people(mocker):
    people_result = {'Person A': {'interests': ['Skill 1', 'Skill 2']}, 'Person B': {'interests': ['Skill 3']}}
    people = application.get_people()
    assert(people == people_result)
