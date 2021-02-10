from helper import replacer;

class Model:
    def __init__(self, entity, variables):
        self.entity = entity;
        self.variables = variables;

    def generateImports(self):
        content = """
import { observable, decorate } from 'mobx';
import { Param as param, Validator } from './';
        """;

        return content;


    def generateDecorator(self):
        result = 'decorate(%s, {\n' % (self.entity);
        for variable in self.variables:
            result += "%s: observable,\n" % (variable);

        result += "}) \n\n";
        return result;

    def generateParameters(self):
        content = "    this.validate = new Validator();\n";
        for idx, variable in enumerate(self.variables):
            content = content + "    this.%s = param(data, '%s');\n" % (variable, variable);

        content = content + "\n    this.validation = {};\n"
        content = content + "    this.validate.initializeErrors(this, this.validation);\n"
        return content;

    def generateToJS(self):
        content = """
  toJS = () => {
    return {
"""
        for idx, variable in enumerate(self.variables):
            newline = "\n" if idx != len(self.variables) -1 else ""
            content = content + '      %s: this.%s,' % (variable, variable) + newline;

        content = content + """
    }
  }
"""
        return content;

    def generate(self):
        imports = self.generateImports();
        decorator = self.generateDecorator();
        parameters = self.generateParameters();
        toJS = self.generateToJS();

        return str(imports) +"\nclass " + str(self.entity) + " {\n  constructor(data){\n"+ parameters + " };\n " + "\n"+ toJS + "}\n\n " + decorator +" export default " + str(self.entity) +";\n";
