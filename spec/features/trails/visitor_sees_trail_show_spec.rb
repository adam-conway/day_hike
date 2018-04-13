describe 'Visitor' do
  scenario 'A visitor goes to trail show page' do
    trip1 = Trip.create!(name: "Hiking", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trip2 = Trip.create!(name: "Surfing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trip3 = Trip.create!(name: "Rock climbing", start_date: Date.strptime('8/29/2013', '%m/%d/%Y'), end_date: Date.strptime('9/10/2013', '%m/%d/%Y'))
    trail1 = Trail.create!(length: 100, name: "best trail", address: "111 middle of forest")
    trail2 = Trail.create!(length: 200, name: "ok trail", address: "222 middle of forest")
    trail3 = Trail.create!(length: 100, name: "bad trail", address: "333 middle of forest")
    TripTrail.create!(trip_id: trip1.id, trail_id: trail2.id)
    TripTrail.create!(trip_id: trip2.id, trail_id: trail2.id)
    TripTrail.create!(trip_id: trip3.id, trail_id: trail2.id)

    visit trail_path(trail2)

    expect(current_path).to eq(trail_path(trail2))
    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.name)
    expect(page).to have_content(trip3.name)
  end
end
