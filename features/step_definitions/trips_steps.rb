Given /the following trips exist/ do |trips_table|
  trips_table.hashes.each do |trip|
    Trip.create trip
  end
end

Then /(.*) seed trips should exist/ do | n_seeds |
  expect(Trip.count).to eq n_seeds.to_i
end

Then /the duration of "(.*)" should be "(.*)"/ do |trip_name, duration|
  expect(page.body).to match(/Details about.*#{trip_name}/)
  expect(page.body).to match(/Duration\s+\(days\):\s+#{duration}/)
end