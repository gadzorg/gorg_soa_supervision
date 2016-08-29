require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :raw_content => "Raw Content",
        :uuid => "Uuid",
        :event_name => "Event Name",
        :sender_id => "Sender",
        :data => ""
      ),
      Message.create!(
        :raw_content => "Raw Content",
        :uuid => "Uuid",
        :event_name => "Event Name",
        :sender_id => "Sender",
        :data => ""
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Raw Content".to_s, :count => 2
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
