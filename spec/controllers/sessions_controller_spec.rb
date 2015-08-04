require "rails_helper"

describe SessionsController do
  describe "POST #create" do
    let!(:user){User.create!(name:"Mike", user_type: "faculty", email: "mike@gmail.com", password: "1231234")}
    it "should not create a new session when given an invalid user" do
      post :create, {user: {name:"Mike", user_type: "faculty", email: "mike@gmail.com", password: "123"}}
      expect(response).to render_template("new")
    end
  end

  # describe "POST #destroy" do
  #   delete :destroy,
  # end
end
