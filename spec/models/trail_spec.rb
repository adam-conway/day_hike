require 'rails_helper'

describe Trail, type: :model do
  # describe 'relationships' do
  #   it {is_expected.to have_many(:trips)}
  #   it {is_expected.to have_many(:trip_trail)}
  # end
  describe 'Analysis methods' do
    context 'Total hiking distance' do
      it 'returns the total hiking distance' do
        trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
        trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")
        trail3 = Trail.create!(length: 100, name: "bad trail", address: "333 middle of forest")

        total = trail1.length + trail2.length + trail3.length

        expect(Trail.total_hiking_distance).to eq(total)
      end
    end
    context 'average hiking distance' do
      it 'returns the average hiking distance' do
        trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
        trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")

        average = (trail1.length + trail2.length)/2

        expect(Trail.average_hiking_distance).to eq(average)
      end
    end
    context 'longest hiking distance' do
      it 'returns the longest hiking distance' do
        trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
        trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")

        longest = trail2.length

        expect(Trail.longest_hiking_distance).to eq(longest)
      end
    end
  end
end
