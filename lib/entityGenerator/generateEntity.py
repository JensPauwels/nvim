# my_prompt.py

from __future__ import print_function, unicode_literals

import sys
import json

from whaaaaat import prompt, print_json

def start():
    questions = [
        {
            'type': 'input',
            'name': 'entity',
            'message': 'Enter the entity name',
        },
        {
            'type': 'input',
            'name': 'variables',
            'message': 'Enter the variables comma seperated',
        },
        {
            'type': 'checkbox',
            'message': 'Select the methods you would like to use',
            'name': 'methods',
            'choices': [
                {
                    'name': 'GET',
                    'checked': True,
                    'value': 1
                },
                {
                    'name': 'GET_ALL',
                    'checked': True,
                    'value': 2
                },
                {
                    'name': 'POST',
                    'checked': True,
                    'value': 3
                },
                {
                    'name': 'PUT',
                    'checked': True,
                    'value': 4
                },
                {
                    'name': 'DELETE',
                    'checked': True,
                    'value': 5
                }
            ]
        }
    ]

    answers = prompt(questions)
    with open(sys.argv[1], 'w') as f:
        json.dump(answers, f)  # use the answers as input for your app


start();



