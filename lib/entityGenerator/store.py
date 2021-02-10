from helper import replacer;
from constants import *;

class Store:
    def __init__(self, entity, methods):
        self.entity = entity;
        self.methods = methods;

    def generateImports(self):
        content = """import { observable, decorate } from 'mobx';
import { doFetch, URL } from '../utils';
import { {entity} } from '../components/models';
        """;

        replacementConfig = {
            '{entity}': self.entity
        };

        return replacer(content, replacementConfig);


    def generateDecorator(self):
        content = '''
  decorate({entity}Store, {
    {entity_lower_first}s: observable,
    new{entity}: observable,
    {entity_lower_first}: observable,
  });
    ''';

        replacementConfig = { 
            '{entity}': self.entity,
            '{entity_lower_first}': self.entity[0].lower() + self.entity[1:],
            '{entity_lower}': self.entity.lower(),

        };

        return replacer(content, replacementConfig);

    def generateConstructor(self):
        content = '''
  constructor() {
    this.new{entity} = new {entity}();
    this.{entity} = new {entity}()
    this.{entity_lower_first}s = [];
  }
    ''';

        replacementConfig = { 
            '{entity}': self.entity,
            '{entity_lower}': self.entity.lower(),
            '{entity_lower_first}': self.entity[0].lower() + self.entity[1:],
        };

        return replacer(content, replacementConfig);

    def generateFunctions(self):

        content = '''
  getAll{entity}Paginated = async () => {
    const { total, data } = await doFetch(URLS.GET_PAGINATED_{entity_upper}S, 'POST', this.sortStore.getSortConfig());
    this.sortStore.setAmountOfPages(total);
    this.{entity_lower_first}s = data.map({entity_lower} => new {entity}({entity_lower}));
  };

  get{entity}ById = async id => {
    const {entity_lower} = await doFetch(URLS.GET_{entity_upper}_BY_ID(id), 'GET');
    this.{entity_lower} = new {entity}({entity_lower});
  };
    ''';

        replacementConfig = { 
            '{entity}': self.entity,
            '{entity_upper}': self.entity.upper(),
            '{entity_lower}': self.entity.lower(),
            '{entity_lower_first}': self.entity[0].lower() + self.entity[1:],
        };

        return replacer(content, replacementConfig);

    def generateURLS(self):

        content = '''
const URLS = {
  GET_PAGINATED_{entity_upper}S: `${URL}`,
  GET_ALL_{entity_upper}S: `${URL}`,
  GET_{entity_upper}_BY_ID: id => `${URL}`
};
    ''';

        replacementConfig = { 
            '{entity_upper}': self.entity.upper(),
        };

        return replacer(content, replacementConfig);

    def generate(self):
        urls = self.generateURLS();
        imports = self.generateImports();
        decorator = self.generateDecorator();
        constructor = self.generateConstructor();
        functions = self.generateFunctions();

        return str(imports) + urls +"\n\nclass " + str(self.entity) + "Store {" + str(constructor) + "\n\n"+ str(functions) + "\n}\n\n " + decorator + "\nexport default new " + str(self.entity) + "Store();";





