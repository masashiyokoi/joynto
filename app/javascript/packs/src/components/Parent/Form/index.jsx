// components/Parent/Form/index.jsx

import React from 'react';
import axios from 'axios';
import {
  CardElement,
  injectStripe
} from 'react-stripe-elements';

import {
  Button
} from 'semantic-ui-react';

import './scss/index.scss';

const createOptions = () => {
  return {
    style: {
      base: {
        fontSize: '18px',
        color: '#424770',
        letterSpacing: '0.025em',
        fontFamily: 'Source Code Pro, monospace',
        '::placeholder': {
          color: '#aab7c4',
        },
      },
      invalid: {
        color: '#9e2146',
      },
    },
  };
};

class Form extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      planId: 'sample_plan',
      planName: 'サンプルプラン',
      planAmount: 2000,
      email: "hogehoge@hoge.com"
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(ev) {
    ev.preventDefault();

    this.props.stripe.createToken({ name: this.state.email }).then(({ token }) => {
    // Railsで作成したAPIのエンドポイント
      axios.post(STRIPE_API,
        {
          stripeToken: token.id,
          client: this.state.email,
          plan: this.state.planId
        }
      );
    });
  }

  render() {
    return (
      <div className="Checkout">
        <form
          className="stripe-form"
          onSubmit={this.handleSubmit}
        >
          <CardElement
            {...createOptions()}
          />
          <Button fluid className="stripe-pay-button">契約する</Button>
        </form>
      </div>
    );
  }
}

// 重要！
export default injectStripe(Form);
