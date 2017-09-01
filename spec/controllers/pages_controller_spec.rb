require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "anonymous user" do
    before :each do
      login_with nil
    end

    it "should be redirected to signin" do
      get :secret

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "logged in user" do
    before :each do
      login_with create(:user)
    end

    it "should let a user see a dashboard" do
      get :secret

      expect(response).to render_template(:secret)
    end
  end
end
