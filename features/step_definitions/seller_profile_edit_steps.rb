
When(/^I visit my profile$/) do
  visit seller_path(@current_seller)
end

Then(/^I visit profile edit page$/) do
  click_link 'Edit'
end

Then(/^I enter valid data$/) do
  #fill_in("Email", :with => 'seller@example.com')
  #fill_in("Password", :with => 'password')
  fill_in("Phone", :with => '0558584736')
  click_button("Update")
end

Then(/^Profile is successfully updated$/) do
  expect(page).to have_content 'Profile updated!'
end

Then(/^I get redirected to profile show page$/) do
  expect(page).to have_css '#seller'
end
