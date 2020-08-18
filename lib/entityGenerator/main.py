import vim;
import json;

from store import Store
from model import Model
from page import Page
from form import Form
from modal import Modal
from helper import writeToFile, controlIfEntityExists, printTitle, adjustIndexFiles


def generateStore(entity, methods, directory):
    printTitle('Adjusting index files for store');
    adjustIndexFiles('%sStore.js' % (entity[0].lower() + entity[1:]), '%s/%s' % (directory, 'index.js'));

    printTitle('generating store');
    store = Store(entity, methods).generate();
    writeToFile(store, '%s/%s' % (directory, '%sStore.js' % (entity[0].lower() + entity[1:])));

def generatePage(entity, methods, directory):
    printTitle('Adjusting index files for page');
    adjustIndexFiles('%ss.js' % (entity), '%s/%s' % (directory, 'index.js'));

    printTitle('generating page');
    page = Page(entity, methods).generate();
    writeToFile(page, '%s/%s' % (directory, '%ss.js' % (entity)));

def generateModel(entity, variables, directory):
    printTitle('Adjusting index files for model');
    adjustIndexFiles('%s.js' % (entity), '%s/%s' % (directory, 'index.js'));

    printTitle('generating model');
    model = Model(entity, variables).generate();
    writeToFile(model, '%s/%s' % (directory, '%s.js' % (entity)));

    
def generateForm(entity, variables, directory):
    printTitle('Adjusting index files for form');
    adjustIndexFiles('%sForm.js' % (entity), '%s/%s' % (directory, 'index.js'));

    printTitle('generating form');
    form = Form(entity, variables).generate();
    writeToFile(form, '%s/%s' % (directory, '%sForm.js' % (entity)));

def generateScssFile(entity, directory):
    printTitle('Creating scss file');
    writeToFile("", '%s/%s' % (directory, '%s.module.scss' % (entity[0].lower() + entity[1:])));

def generateModal(entity, directory): 
    printTitle('Adjusting index files for modal');
    adjustIndexFiles('New%sModal.js' % (entity), '%s/%s' % (directory, 'index.js'));

    printTitle('generating modal');
    modal = Modal(entity).generate();
    writeToFile(modal, '%s/New%s' % (directory, '%sModal.js' % (entity)));



def startGenerator(data):
    print(data);

    variables = data['variables'].replace(' ', '').split(',');
    generateStore(data['entity'], data['methods'], '/src/stores');
    generatePage(data['entity'], data['methods'], '/src/components/pages');
    generateModel(data['entity'], variables, '/src/components/models'); 
    generateForm(data['entity'], variables, '/src/components/forms');
    generateModal(data['entity'], '/src/components/modals');
    generateScssFile(data['entity'], '/src/assets/styles');
    vim.command('checktime')

