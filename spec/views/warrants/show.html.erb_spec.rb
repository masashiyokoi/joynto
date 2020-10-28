require 'rails_helper'

RSpec.describe "warrants/show", type: :view do
  before(:each) do
    @warrant = assign(:warrant, Warrant.create!(
      status: 2,
      price_per_hour: 3,
      beneficiary_user_id: 4,
      issuer_user_id: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
