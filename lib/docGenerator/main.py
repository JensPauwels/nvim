import vim;
import json;

from helper import writeToFile, controlIfEntityExists, printTitle, adjustIndexFiles, createDirectory
from generator import Generator

def generateEntity(entity, directory):
    content = Generator(entity).generateEntity();
    writeToFile(content, '%s/%s' % (directory, '%s.js' % (entity)));

def generateIndex(entity, directory):
    content = Generator(entity).generateIndex();
    writeToFile(content, '%s/index.js' % (directory));

def generateTests(entity, directory):
    content = Generator(entity).generateTests();
    writeToFile(content, '%s/%s' % (directory, '%s.test.js' % (entity)));

def generateExamples(entity, directory):
    content = Generator(entity).generateExamples();
    writeToFile(content, '%s/%s' % (directory, '%s.examples.md' % (entity)));

def adjustIndexFile(entity, directory):
    printTitle('Adjusting index files for form');
    adjustIndexFiles('%s' % (entity), '/src/lib/index.js');

def generateStyles(entity, directory):
    writeToFile('', '%s/styles.css' % (directory));

def createEntityDirectory(entity, directory):
    createDirectory(directory);

def startGenerator(data):
    print();

    if (controlIfEntityExists(data['entity']) != True):
        entity = data['entity'];
        directory = '/src/lib/components/%s/' % (entity)

        createDirectory(directory);
        generateEntity(entity, directory);
        # generateExamples(entity, directory);
        generateTests(entity, directory);
        generateIndex(entity, directory);
        generateStyles(entity, directory);
        adjustIndexFile(entity, directory)
        # allows to reload page
        vim.command('checktime')
    else:
        print 'entity name already exists';



