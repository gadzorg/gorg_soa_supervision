require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :uuid => "",
      :event_name => "MyString",
      :sender_id => "MyString",
      :data => ""
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_uuid[name=?]", "event[uuid]"

      assert_select "input#event_event_name[name=?]", "event[event_name]"

      assert_select "input#event_sender_id[name=?]", "event[sender_id]"

      assert_select "input#event_data[name=?]", "event[data]"
    end
  end
end
