require 'rails_helper'

RSpec.describe "warrants/index", type: :view do
  before(:each) do
    assign(:warrants, [
      Warrant.create!(
        status: 2,
        price_per_hour: 3,
        beneficiary_user_id: 4,
        issuer_user_id: 5
      ),
      Warrant.create!(
        status: 2,
        price_per_hour: 3,
        beneficiary_user_id: 4,
        issuer_user_id: 5
      )
    ])
  end

  it "renders a list of warrants" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
  end
end
