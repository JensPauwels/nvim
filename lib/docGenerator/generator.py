from helper import replacer;

class Generator:
    def __init__(self, entity):
        self.entity = entity;

    def generateEntity(self):
        content = """
import React from 'react'
import PropTypes from 'prop-types'
import './styles.css'

const {entity} = () => (
  <div>{entity}</div>
)

{entity}.propTypes = {

}

{entity}.defaultProps = {

}

export default {entity}
        """

        replacementConfig = {
            '{entity}': self.entity
        };

        return replacer(content, replacementConfig);

    def generateIndex(self):
        return 'export { default } from \'./%s\'' % self.entity;

    def generateExamples(self):
        content = """
{entity} examples:

###### Button
```js
import { {entity} } from 'react-rollup-boilerplate';

<{entity}/>
```
"""

        replacementConfig = {
            '{entity}': self.entity
        };

        return replacer(content, replacementConfig);

    def generateTests(self):
        content = """
import React from 'react'
import { shallow } from 'enzyme'

import {entity} from './{entity}'

describe('<{entity} />', () => {
  it('should render', () => {
    const wrapper = shallow(<{entity} />)

    expect(wrapper).toBeDefined()
  })
})
```
        """

        replacementConfig = {
            '{entity}': self.entity
        };

        return replacer(content, replacementConfig);

