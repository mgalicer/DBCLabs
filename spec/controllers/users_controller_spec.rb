require "rails_helper"

describe UsersController do
  describe "POST #create" do
    it "should create a new user" do
      post :create, {user: {name:"Mike", user_type: "faculty", email: "mike@gmail.com", password: "1231234"}}
      # p assigns(:user).valid?
      # p assigns(:user).error.full_messages
      expect(assigns(:user)).not_to be_new_record
    end

  end
end
