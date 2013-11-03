require 'spec_helper'

describe "fish/new" do
  before(:each) do
    assign(:fish, stub_model(Fish,
      :name => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new fish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fish_index_path, :method => "post" do
      assert_select "input#fish_name", :name => "fish[name]"
      assert_select "textarea#fish_desc", :name => "fish[desc]"
    end
  end
end
