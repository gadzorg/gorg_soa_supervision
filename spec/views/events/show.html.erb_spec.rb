require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :uuid => "",
      :event_name => "Event Name",
      :sender_id => "Sender",
      :data => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(//)
  end
end
