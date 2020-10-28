require 'rails_helper'

RSpec.describe Warrant, type: :model do
  it "is valid with title, text and user_id" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    user3 = FactoryBot.create(:user)

    match = Match.create(match_type: :direct_match)
    user1.user_request_matches.create(match: match)
    user2.user_accept_matches.create(match: match)

    warrant = user1.issuer_warrants.create(owner_user: user2).save!
  end
end
