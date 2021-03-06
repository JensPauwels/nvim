from whaaaaat import prompt
from pyfzf.pyfzf import FzfPrompt

import sys
import json
import os

subdirs = [x[0] for x in os.walk('.' + '/src')]

def start():

    fzf = FzfPrompt()
    result = fzf.prompt(subdirs)

    questions = [
        {
            'type': 'input',
            'name': 'entity',
            'message': 'Enter the name of the new file',
        }
    ]


    answers = prompt(questions)
    answers['directory'] = result[0];

    with open(sys.argv[1], 'w') as f:
        json.dump(answers, f)  # use the answers as input for your app


start();



