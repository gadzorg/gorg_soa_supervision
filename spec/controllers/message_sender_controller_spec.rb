require 'rails_helper'

RSpec.describe MessageSenderController, type: :controller do

  describe "GET #send_message" do
    it "returns http success" do
      get :send_message
      expect(response).to have_http_status(:success)
    end
  end

end
