require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :uuid => "",
      :event_name => "MyString",
      :sender_id => "MyString",
      :data => ""
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_uuid[name=?]", "event[uuid]"

      assert_select "input#event_event_name[name=?]", "event[event_name]"

      assert_select "input#event_sender_id[name=?]", "event[sender_id]"

      assert_select "input#event_data[name=?]", "event[data]"
    end
  end
end
