require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :latitude => 1.5,
        :longitude => 1.5,
        :airTemp => 1.5,
        :amount => 1,
        :length => 1.5
      ),
      stub_model(Event,
        :name => "Name",
        :latitude => 1.5,
        :longitude => 1.5,
        :airTemp => 1.5,
        :amount => 1,
        :length => 1.5
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
