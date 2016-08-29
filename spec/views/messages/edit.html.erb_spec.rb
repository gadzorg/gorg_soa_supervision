require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :raw_content => "MyString",
      :uuid => "MyString",
      :event_name => "MyString",
      :sender_id => "MyString",
      :data => ""
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_raw_content[name=?]", "message[raw_content]"

      assert_select "input#message_uuid[name=?]", "message[uuid]"

      assert_select "input#message_event_name[name=?]", "message[event_name]"

      assert_select "input#message_sender_id[name=?]", "message[sender_id]"

      assert_select "input#message_data[name=?]", "message[data]"
    end
  end
end
