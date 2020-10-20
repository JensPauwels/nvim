from googletrans import Translator 
import sys
import json
import pyperclip

translator = Translator()

def executeTranslation(data):
    key = data['key'].replace(" ", "_");
    toTranslate = data['text'];
    defaultLanguage = "en";
    languages = ["nl", "de", "fr"];

    translatedObject = {
        key: {}
    };

    translatedObject[key][defaultLanguage] = toTranslate;

    for language in languages:
        result = translator.translate(toTranslate, dest=language);
        translatedObject[key][language] = result.text;

    jsonObj = json.dumps(translatedObject, indent=2);

    splitted = jsonObj.splitlines();

    combined = "";

    for idx, line in enumerate(splitted):
        if (idx != 0 and idx != (len(splitted) -1)):
            combined += line;
            combined += "\n"

    print(combined)
    pyperclip.copy(combined)
