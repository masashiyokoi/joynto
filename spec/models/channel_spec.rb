require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe 'association' do
    describe 'has_many' do
      it { is_expected.to have_many(:messages).dependent(:destroy) }
    end
  end
end
