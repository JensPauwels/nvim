import os
import vim

def replacer(string, replacements):
    result = string;
    for key, value in replacements.items():
        result = result.replace(key, value);

    return result;


def writeToFile(content, file):
    currentDirectory = vim.eval("g:pwd");
    filePath = os.path.abspath('%s/%s' % (currentDirectory, file)).replace('\n', '')
    method = "a+" if os.path.isfile(filePath)  else "w+"

    f = open(filePath, method); 
    f.write(content);

def controlIfEntityExists(entity):
    printTitle('Control if file exists');

    exists = False;

    currentDirectory = vim.eval("g:pwd");
    filePath = os.path.abspath('%s/%s' % (currentDirectory, '/src/lib/index.js'));
    currentFile = open(filePath.replace('\n', ''), "r");

    if (currentFile.mode == "r"):
        lines = currentFile.readlines();
        for line in lines:
            if (entity in line):
                exists = True;

    print(exists == True)
    return exists == True;

def printTitle(title):
    print(' ')
    print('--------------------------');
    print(title);
    print('--------------------------');

def adjustIndexFiles(entityName, indexFile):
    writeToFile("export { default as %s } from './components/%s'\n" % (entityName.replace('.js', ''), entityName), indexFile);

def createDirectory(directory):
    currentDirectory = vim.eval("g:pwd");
    filePath = os.path.abspath('%s/%s' % (currentDirectory, directory));
    print(filePath)
    os.makedirs(filePath.replace('\n', ''));

