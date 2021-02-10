from __future__ import print_function, unicode_literals
from whaaaaat import prompt

import sys
import json
import os


def start():

    questions = [
        {
            'type': 'input',
            'name': 'key',
            'message': 'Enter the JSON key',
        },
        {
            'type': 'input',
            'name': 'text',
            'message': 'Enter the text in the default language',
        }
    ];


    answers = prompt(questions)

    with open(sys.argv[1], 'w') as f:
        json.dump(answers, f)  # use the answers as input for your app


start();



