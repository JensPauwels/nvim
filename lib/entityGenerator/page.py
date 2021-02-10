from helper import replacer;
from constants import *

class Page:
    def __init__(self, entity, methods):
        self.entity = entity;
        self.methods = methods;

    def generateImports(self):
        content = """
import React, { useEffect, useState } from 'react';
import { useObserver } from 'mobx-react-lite';
import { FormattedMessage } from 'react-intl';

import { Pagination, Button } from '../elements';
import { useStore, useRedirect, useTitle } from '../../hooks';
import { New{entity}Modal } from '../modals';

import { openModal } from '../../utils';
import styles from '../../assets/styles/{entity_lower_first}.module.scss'
""";
        replacementConfig = {
            '{entity}': self.entity,
            '{entity_lower}': self.entity.lower(),
            '{entity_lower_first}': self.entity[0].lower() + self.entity[1:],
        };

        return replacer(content, replacementConfig);

    def generateFunctions(self):
        content = """
  const {entity_lower_first}Store = useStore('{entity_lower_first}Store');
  const { redirect } = useRedirect();
  const [isFilterContainerOpen, setIsFilterContainerOpen] = useState(false);

  useTitle('new_page');

  useEffect(() => {
    {entity_lower_first}Store.getAll{entity}Paginated();
  }, [{entity_lower_first}Store]);

  const openNew{entity}Modal = () => {
    openModal('new{entity}Modal');
  };

  return useObserver(() => {
    const { {entity_lower_first}s } = {entity_lower_first}Store;

    return (
      <>
        <New{entity}Modal />

        <div className="cta">
          <div className="buttons">
            <Button text="filter" icon="fa-search" onClick={() => setIsFilterContainerOpen(!isFilterContainerOpen)}/>
            <Button text="add_{entity_lower}" icon="fa-plus" onClick={openNew{entity}Modal}/>
          </div>

          <Pagination />
        </div>

        <ul className="list">
          <li className={`header ${styles.collection}`}>
            <span>
              HEADER
            </span>
          </li>

          {
            {entity_lower_first}s.map({entity_lower_first} => (
              <li key={{entity_lower_first}.id} className={`listItem ${styles.collection}`} onClick={() => redirect(`{entity_lower_first}/${{entity_lower_first}.id}`)}>
                <pre>{JSON.stringify({entity_lower_first}, null, 2)}</pre>
              </li>
            ))
          }
        </ul>
        <Pagination />
      </>

    )
  })""";

        replacementConfig = {
            '{entity_lower}': self.entity.lower(),
            '{entity_lower_first}': self.entity[0].lower() + self.entity[1:],
            '{entity}': self.entity
        };

        return replacer(content, replacementConfig);



    def generate(self):
        imports = self.generateImports();
        functions = self.generateFunctions();

        return str(imports) + "\nconst " + str(self.entity) + "s = () =>  {\n" + functions + "\n}\n export default " + str(self.entity)+ "s\n";
