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
            'message': 'Enter the Component name',
        },
    ]

    answers = prompt(questions)
    with open(sys.argv[1], 'w') as f:
        json.dump(answers, f)  # use the answers as input for your app


start();



