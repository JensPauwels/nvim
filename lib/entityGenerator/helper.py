import os
import vim

def replacer(string, replacements):
    result = string;
    for key, value in replacements.items():
        result = result.replace(key, value);

    return result;


def writeToFile(content, file):
    currentDirectory = vim.eval("g:pwd");
    filePath = os.path.abspath('%s/%s' % (currentDirectory, file));

    f = open(filePath.replace('\n', ''), "a"); 
    f.write("\n" + content);

def controlIfEntityExists(entity):
    printTitle('Control if file exists');

    exists = False;

    currentDirectory = vim.eval("g:pwd");

    filePath = os.path.abspath('%s/%s' % (currentDirectory, file));
    currentFile = open(filePath.replace('\n', ''), "r");
    print(currentFile);

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
    writeToFile("export { default as %s } from './%s'" % (entityName.replace('.js', ''), entityName), indexFile);
