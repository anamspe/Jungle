require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      user = User.new({
        email: "a@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: "password"
      })

      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.new({
        email: nil,
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: "password"
      })

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid without a first name" do
      user = User.new({
        email: "a@a.com",
        first_name: nil,
        last_name: "Johnson",
        password: "password",
        password_confirmation: "password"
      })

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      user = User.new({
        email: "a@a.com",
        first_name: "Alice",
        last_name: nil,
        password: "password",
        password_confirmation: "password"
      })

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without a password or a password_confirmation" do
      user = User.new({
        email: "a@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: nil
      })

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is not valid with an email that has been registered before" do
      user1 = User.create({
        email: "a@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: "password"
      })

      user2 = User.new({
        email: "a@a.com",
        first_name: "Violet",
        last_name: "Blue",
        password: "password",
        password_confirmation: "password"
      })
      
      expect(user1).to be_valid
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "is not valid if password and password_confirmation don't match" do
      user = User.new({
        email: "a@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: "pasword"
      })

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is not valid with a password that is shorter than 6 characters" do
      user = User.new({
        email: "a@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "pass",
        password_confirmation: "pass"
      })

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do

    it "ignores leading and/or trailing whitespace in email" do
      user = User.create({
        email: "a@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: "password"
      })

      authenticated_user = User.authenticate_with_credentials(' a@a.com   ', 'password')
      
      expect(authenticated_user).to eq(user)
    end

    it "ignores case in emails" do
      user = User.create({
        email: "alice_johnson@a.com",
        first_name: "Alice",
        last_name: "Johnson",
        password: "password",
        password_confirmation: "password"
      })

      authenticated_user = User.authenticate_with_credentials('ALICE_johnSON@a.Com', 'password')

      expect(authenticated_user).to eq(user)
    end

  end

end
