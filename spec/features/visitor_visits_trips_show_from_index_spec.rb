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

    visit trips_path

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.start_date)
    expect(page).to have_content(trip3.end_date)
  end
end
