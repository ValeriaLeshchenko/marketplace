
Then(/^I click the link to add product page$/) do
  Rails.application.load_seed
  click_link 'Add new product'
end

Then(/^I get redirected to product add page$/) do
  expect(page).to have_css("form[id='new_product']")
end

Then(/^I submit the form with valid product data$/) do
  fill_in("Name", :with => 'T-shirt')
  fill_in("Description", :with => 'A casual T-shirt')
  fill_in("Company", :with => 'Puma')
  fill_in("Count", :with => '20')
  attach_file "Picture", File.join(Rails.root, '/features/support/product.png')
  select "red", :from => 'product_color_ids'
  select "white", :from => 'product_color_ids'
  select "XS", :from => 'product_size_ids'
  fill_in 'Tags', :with => 'stylish, cool'
  fill_in("Amount", :with => 24)
  select "RUB", :from => 'product_price_attributes_currency'
  click_button("Create Product")

end

Then(/^the product is created$/) do
  expect(page).to have_content('Product was successfully created.')
end

Then(/^I get redirected to home page$/) do
  expect(page).to have_content('Welcome to the Marketplace!')
end