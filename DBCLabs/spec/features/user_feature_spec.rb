require 'rails_helper'

describe "User creates a valid account", :type => :feature do
  before :each do
    User.create(name: "Fufu", user_type: "faculty", email: "fufu@fu.com", password: "iamfufu")
  end
  it "user should be able to view new account form" do
    visit '/'
    click_link("Sign Up")
    expect(page).to have_button("Register")
  end

  it "User enters relevant information for a new account & submits form" do
    visit new_user_path
    fill_in 'user_name', :with => 'Fufu'
    select 'faculty', from: "user_user_type"
    fill_in 'user_email', :with => 'fufu@fu.com'
    fill_in 'user_password', :with => 'iamfufu'
    click_button 'Register'
  end
end

describe "User successfully logs in", :type => :feature do
  User.create(name: 'Fu', user_type: "faculty", email: 'fufu@fu.com', password: 'iamfufu')
  it "user enters valid account info" do
    visit new_session_path
    fill_in 'user_name', :with=>'Fu'
    fill_in 'user_password', :with=>'iamfufu'
    click_button 'Login'
    expect(page).to have_content("experiments")
  end
end
