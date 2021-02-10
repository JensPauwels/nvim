from helper import replacer;

class Modal:
    def __init__(self, entity):
        self.entity = entity;

    def generateImports(self):
        content = """
import React from 'react';
import { FormattedMessage } from 'react-intl';
import { useObserver } from 'mobx-react-lite';

import { closeModal } from '../../utils';
import { Button, Modal } from '../elements';
import { {entity}Form } from '../forms';

import { useStore } from '../../hooks';
        """;

        replacementConfig = {
            '{entity}': self.entity,
        };

        return replacer(content, replacementConfig);


    def generateFunctions(self):

        content = """
  const {entity_lower_first}Store = useStore('{entity_lower_first}Store');

  const cancel = () => {
    closeModal('new{entity}Modal');
  };

  const create{entity} = () => {
    console.log('create {entity}');
  };

  return useObserver(() => {
    const { new{entity}} = {entity_lower_first}Store;
    return (
      <Modal id="new{entity}Modal">
        <div className="modal-header">
          <h1>
            <FormattedMessage id="new_{entity_lower}_modal"/>
          </h1>
          <i className="fas fa-times" onClick={cancel} />
        </div>

        <div className="modal-content">
          <{entity}Form entity={new{entity}}/>
        </div>
        <div className="modal-footer">
          <Button text="add_{entity_lower}" onClick={create{entity}} />
          <Button text="cancel" onClick={cancel}/>
        </div>
      </Modal>
    )
  })""";

        replacementConfig = {
            '{entity}': self.entity,
            '{entity_lower}': self.entity.lower(),
            '{entity_lower_first}': self.entity[0].lower() + self.entity[1:],
        };

        return replacer(content, replacementConfig);

    def generate(self):
        imports = self.generateImports();
        functions = self.generateFunctions();

        return str(imports)  + "\nconst New" + str(self.entity) + "Modal = () => {\n" + functions + "\n}\n" + "export default New" + str(self.entity) + "Modal;";
