function! Model()
python << PYEND
import vim

def python_input(message = 'input'):
  vim.command('call inputsave()')
  vim.command("let user_input = input('" + message + ": ')")
  vim.command('call inputrestore()')
  return vim.eval('user_input')



def addDecorate(array, constructorName):
    result = 'decorate(%s, {\n' % (constructorName);
    for occurence in array:
        result += "%s: observable,\n" % (occurence.strip());

    result += "})";
    return result;

def overwriteValues(array):
    result = '';
    for occurence in array:
        stripped = occurence.strip();
        result += "this." + stripped + " = param(data, \'" + stripped + "\');\n";
    return result;

def imports():
    return """import { observable, decorate } from 'mobx';
import { Param as param, Validator } from './';

"""

def wrapInConstructor(string):
    return "constructor(data) {\nthis.validate = new Validator();\n\t" + string + "\nthis.validation = {};\n\tthis.validate.initializeErrors(this, this.validation);\n}";


def createToJs(array):
    result = 'toJS = () => {\n\treturn {\n\t';
    for occurence in array:
        stripped = occurence.strip();
        result += stripped + ": this." + stripped + ",\n\t";
    result += "}\n}";
    return result;


def demo():
    constructorName = python_input('Enter the constructor name');
    parameters = python_input('Enter the variables comma seperated');
    splitted = parameters.split(',');
    myImports = imports();
    params = overwriteValues(splitted);
    constructor = wrapInConstructor(params);
    toJS = createToJs(splitted);

    decorate = addDecorate(splitted, constructorName);
    
    result = myImports + "class " + constructorName +" {\n" + constructor + "\n\n" + toJS + "\n}\n"  + decorate + "\n\nexport default " + constructorName;


    (row,col)   = vim.current.window.cursor
    vim.current.buffer.append(result.splitlines(), row - 1);

demo();
PYEND
endfunction


function! Input()
python << PYEND
import vim

def python_input(message = 'input'):
  vim.command('call inputsave()')
  vim.command("let user_input = input('" + message + ": ')")
  vim.command('call inputrestore()')
  return vim.eval('user_input')

def demo():
    variable = python_input(message = 'Enter the input variable');
    result = "<div className=\"input\">\n\t<Label htmlFor=\"" + variable + "\" />\n\t<Input id=\"" + variable + "\" context={this} name=\"" + variable + "\" value={" + variable + "} /> \n\t</div>"

    (row,col)   = vim.current.window.cursor
    vim.current.buffer.append(result.splitlines(), row - 1);

demo();
PYEND
endfunction
