When(/^i visit the login page$/) do
  visit '/login'
end

When(/^i fill in my email and password$/) do
  fill_in("Email", :with => 'seller@example.com')
  fill_in("Password", :with => 'password')
  click_button("Sign in")
end

Then(/^I login successfully$/) do
  expect(page).to have_content('Signed in successfully.')
end

Then(/^get redirected to my profile$/) do
  expect(page).to have_css '#seller'
end
