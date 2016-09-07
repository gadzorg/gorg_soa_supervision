require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :uuid => "",
        :event_name => "Event Name",
        :sender_id => "Sender",
        :data => ""
      ),
      Event.create!(
        :uuid => "",
        :event_name => "Event Name",
        :sender_id => "Sender",
        :data => ""
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
