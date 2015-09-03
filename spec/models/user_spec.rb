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

  it "ensures emails are unique" do
    user1 = User.create(email: "test@email.com", password: "123456")
    user2 = User.new(email: "test@email.com", password: "123456")
    user2.save
    expect(user2.errors.full_messages).to include("Email has already been taken")
  end




end
