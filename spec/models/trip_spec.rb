require 'rails_helper'

describe Trip, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:trails)}
    it {is_expected.to have_many(:trip_trails)}
  end
end
