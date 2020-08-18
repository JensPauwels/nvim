import vim;
import json;
import os;

def writeToFile(content, filePath):
    method = "a+" if os.path.isfile(filePath)  else "w+"

    f = open(filePath.replace('\n', ''), method);
    f.write(content);

def adjustIndexFiles(entityName, indexFile):
    writeToFile("\nexport { default as %s } from './%s'" % (entityName.replace('.js', ''), entityName), indexFile);

def generateFile(entity, directory):
    writeToFile('', '%s/%s' % (directory, entity))


def startGenerator(data):
    generateFile(data['entity'], data['directory']);
    adjustIndexFiles(data['entity'], '%s/index.js' % data['directory'])
