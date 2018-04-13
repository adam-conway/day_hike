require 'rails_helper'

describe Trail, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:trips)}
    it {is_expected.to have_many(:trip_trails)}
  end
end
