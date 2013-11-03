require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :airTemp => 1.5,
      :amount => 1,
      :length => 1.5
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_latitude", :name => "event[latitude]"
      assert_select "input#event_longitude", :name => "event[longitude]"
      assert_select "input#event_airTemp", :name => "event[airTemp]"
      assert_select "input#event_amount", :name => "event[amount]"
      assert_select "input#event_length", :name => "event[length]"
    end
  end
end
