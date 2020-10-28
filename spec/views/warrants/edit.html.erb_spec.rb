require 'rails_helper'

RSpec.describe "warrants/edit", type: :view do
  before(:each) do
    @warrant = assign(:warrant, Warrant.create!(
      status: 1,
      price_per_hour: 1,
      beneficiary_user_id: 1,
      issuer_user_id: 1
    ))
  end

  it "renders the edit warrant form" do
    render

    assert_select "form[action=?][method=?]", warrant_path(@warrant), "post" do

      assert_select "input[name=?]", "warrant[status]"

      assert_select "input[name=?]", "warrant[price_per_hour]"

      assert_select "input[name=?]", "warrant[beneficiary_user_id]"

      assert_select "input[name=?]", "warrant[issuer_user_id]"
    end
  end
end
