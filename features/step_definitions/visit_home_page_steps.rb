# Guest visit
Given(/^I am a guest$/) do

end

When(/^I visit the home page$/) do
  visit '/'
end

Then(/^I should see link to login$/) do
  expect(page).to have_content('Login')
end

Then(/^I should see link to register$/) do
  expect(page).to have_content('Register')
end
#####



# Seller visit
Given(/^I am a seller$/) do
  @current_seller = Seller.create!(
      :password => 'password',
      :password_confirmation => 'password',
      :email => "seller@example.com"
  )
end

When(/^I login$/) do
  visit "/login"
  fill_in("Email", :with => 'seller@example.com')
  fill_in("Password", :with => 'password')
  click_button("Sign in")
end

Then(/^I should see link to logout$/) do
  expect(page).to have_content('Logout')
end

Then(/^I should not see link to login$/) do
  expect(page).not_to have_content('Login')
end

Then(/^I should not see link to register$/) do
  expect(page).not_to have_content('Register')
end
#####