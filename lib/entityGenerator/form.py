from helper import replacer;

class Form:
    def __init__(self, entity, variables):
        self.entity = entity;
        self.variables = variables;

    def generateImports(self):
        content = """
import React from 'react';
import { useObserver } from 'mobx-react-lite';
import { Input, Label } from '../elements';
        """;

        return content;

    def generateInputs(self):
        content = "";

        for idx, variable in enumerate(self.variables):
            variableContent = """
          <div className="input">
             <Label htmlFor="{variable}" />
             <Input entity={entity} name="{variable}" /> 
          </div>
            """;

            replacementConfig = {
                '{variable}': variable
            };

            result = replacer(variableContent, replacementConfig);
            content = content + result;

        return content;



    def generateFunctions(self):
        inputs = self.generateInputs();

        content = """
  return useObserver(() => {
    return (
      <>
        {inputs}
      </>
    )
  })""";

        replacementConfig = {
            '{inputs}': inputs
        };

        return replacer(content, replacementConfig);

    def generate(self):
        imports = self.generateImports();
        functions = self.generateFunctions();

        return str(imports)  + "\nconst " + str(self.entity) + " = ({ entity }) => {\n" + functions + "\n}\n" + "export default " + str(self.entity) + ";";
