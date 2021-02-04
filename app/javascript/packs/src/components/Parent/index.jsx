// components/Parent/index.jsx
import React from 'react';

import {
  Elements
} from 'react-stripe-elements';

import Form from './Form';

class Parent extends React.Component {
  render() {
    return (
      <Elements>
        <Form />
      </Elements>
    );
  }
}

export default Parent;
