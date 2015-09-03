require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires an email address" do
    user = User.new(password:"123456")
    user.save
    expect(user.errors.full_messages).to include("Email can't be blank")
  end

  it "requires password be at least 6 characters" do
    user = User.new(email:"test@email.com", password:"12345")
    user.save
    expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  



end
