
Given /the following activities exist/ do |activities_table|
  activities_table.hashes.each do |activity|
    Activity.create activity
  end
end

Then /(.*) seed activities should exist/ do | n_seeds |
  expect(Activity.count).to eq n_seeds.to_i
end

Then /the address of "(.*)" should be "(.*)"/ do |activity_name, address|
  expect(page.body).to match(/Details about.*#{activity_name}/)
  expect(page.body).to match(address)
end