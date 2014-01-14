When(/^i visit the register page$/) do
  visit '/register'
end

When(/^i fill in my email, password and confirmation$/) do
  fill_in("Email", :with => 'seller@example.com')
  fill_in("Password", :with => 'password')
  fill_in("Password confirmation", :with => 'password')
  click_button("Sign up")
end

Then(/^I register successfully$/) do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end
