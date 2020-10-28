require 'rails_helper'

RSpec.describe "warrants/new", type: :view do
  before(:each) do
    assign(:warrant, Warrant.new(
      status: 1,
      price_per_hour: 1,
      beneficiary_user_id: 1,
      issuer_user_id: 1
    ))
  end

  it "renders new warrant form" do
    render

    assert_select "form[action=?][method=?]", warrants_path, "post" do

      assert_select "input[name=?]", "warrant[status]"

      assert_select "input[name=?]", "warrant[price_per_hour]"

      assert_select "input[name=?]", "warrant[beneficiary_user_id]"

      assert_select "input[name=?]", "warrant[issuer_user_id]"
    end
  end
end
