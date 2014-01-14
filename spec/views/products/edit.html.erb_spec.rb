require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :company => "MyString",
      :count => 1,
      :published => false
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "textarea#product_description[name=?]", "product[description]"
      assert_select "input#product_company[name=?]", "product[company]"
      assert_select "input#product_count[name=?]", "product[count]"
      assert_select "input#product_published[name=?]", "product[published]"
    end
  end
end