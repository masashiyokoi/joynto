if Rails.env.development? || Rails.env.test?
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_51HmTQWF4WJ461dsUPBTsbD3pvXmQtGnPsqBbpNgbDzTXvXn66HZEZOa90hjhX5g4wQLlBBNubgIxWPsXG36hhC1T0079RT02jc',
    :secret_key      => 'sk_test_51HmTQWF4WJ461dsUACwxvWmWn4teawiEBA0VXptli3aWVS2Nd8olPE4nn9fgEFlpC4n37x5GHpPw435b1yGDLNCf00sxGTqBHj'
  }
end

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY_PRODUCTON'],
    :secret_key      => ENV['STRIPE_SECRET_KEY_PRODUCTION']
  }
end

# Stripe.api_key = Rails.configuration.stripe[:secret_key]
#
# Stripe::Charge.create({
#   amount: 8000,
#   currency: "jpy", # 請求通貨は円で固定していますが変更可能です
#   customer: c.id,
# })
#
#
# Stripe::Customer.create_source(
#   c.id,
#   { source: "tok_visa" },
# )
