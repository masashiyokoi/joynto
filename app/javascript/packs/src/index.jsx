// src/index.jsx
import React from 'react';
import {
  render,
} from 'react-dom';

// Polyfill
import 'babel-polyfill';

// Stripe
import {
  StripeProvider
} from 'react-stripe-elements';

// CSS
import 'csspin/csspin.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'react-bootstrap-table/dist/react-bootstrap-table-all.min.css';
import 'semantic-ui-css/semantic.min.css';

import injectTapEventPlugin from 'react-tap-event-plugin';

// Redux
import {
  Provider,
} from 'react-redux';
import store from './../store/storeSettings';

// AppRoute
import AppRoute from './../route';

injectTapEventPlugin();


render((
  <Provider
    store={store}
  >
    <StripeProvider apiKey={STRIPE_PUBLISHIBLE_KEY}>
      <AppRoute />
    </StripeProvider>
  </Provider>
), document.getElementById('root'));
