require "rails_helper"

describe User do
  describe "#password_length" do
    let(:user) { User.new(name:"Dog", password: "1234") }
    it "should only save the user if the entered password is greater than six characters" do
      # expect(User.find_by(name: "Dog")).to be nil
      expect(user).not_to be_valid
    end
  end

  xdescribe "#uniqueness" do
    let!(:user) { User.create!(name:"Dog", password: "123456") }
    subject { user }
    it { should validate_uniqueness_of(:name)}
  end

  describe "#authenticate" do
    let!(:user) { User.create!(name:"Mike", user_type: "faculty", email: "mike@gmail.com", password: "1234567") }
    it 'should return the correct user when authenticate is called' do

      expect(User.authenticate({name:"Mike", password: "1234567"}).id).to eq user.id
    end
  end
end
