require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :raw_content => "Raw Content",
      :uuid => "Uuid",
      :event_name => "Event Name",
      :sender_id => "Sender",
      :data => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Raw Content/)
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(//)
  end
end
