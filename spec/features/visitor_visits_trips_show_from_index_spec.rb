# As a visitor,
#   when I visit the trips index,
#   and I click a link to a trip show,
#   I see a list of trails included in the trip,
#   I see the name, address, and length for each trail.

require 'rails_helper'

describe 'Visitor' do
  scenario 'A visitor goes to trip index visits trip show page' do
    trip1 = Trip.create!(name: "Hiking", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trip2 = Trip.create!(name: "Surfing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trip3 = Trip.create!(name: "Rock climbing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
    trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")
    trail3 = Trail.create!(length: 100, name: "bad trail", address: "333 middle of forest")
    TripTrail.create!(trip_id: trip2.id, trail_id: trail1.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail2.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail3.id)

    visit trips_path

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.start_date)
    expect(page).to have_content(trip3.end_date)

    click_on(trip2.name)

    expect(current_path).to eq(trip_path(trip2))
    expect(page).to have_content(trail1.length)
    expect(page).to have_content(trail2.name)
    expect(page).to have_content(trail3.address)
  end
  scenario 'A visitor sees total hiking distance' do
    trip2 = Trip.create!(name: "Surfing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
    trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")
    trail3 = Trail.create!(length: 100, name: "bad trail", address: "333 middle of forest")
    TripTrail.create!(trip_id: trip2.id, trail_id: trail1.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail2.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail3.id)

    visit trip_path(trip2)

    expect(page).to have_content("400")
  end
  scenario 'A visitor sees average hiking distance' do
    trip2 = Trip.create!(name: "Surfing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
    trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")
    TripTrail.create!(trip_id: trip2.id, trail_id: trail1.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail2.id)

    visit trip_path(trip2)

    expect(page).to have_content("150")
  end
  scenario 'A visitor sees longest hiking distance' do
    trip2 = Trip.create!(name: "Surfing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
    trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")
    TripTrail.create!(trip_id: trip2.id, trail_id: trail1.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail2.id)

    visit trip_path(trip2)

    expect(page).to have_content("Longest hiking distance: 200")
  end
end
