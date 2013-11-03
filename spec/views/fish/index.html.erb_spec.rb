require 'spec_helper'

describe "fish/index" do
  before(:each) do
    assign(:fish, [
      stub_model(Fish,
        :name => "Name",
        :desc => "MyText"
      ),
      stub_model(Fish,
        :name => "Name",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of fish" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
