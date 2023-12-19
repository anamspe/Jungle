class User < ApplicationRecord
  
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = find_by_email(email.strip.downcase)
    unless user
      puts "No user with this email was found."
    end

    user if user && user.authenticate(password)
  end

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, if: :password
  
  validate :password_confirmation_match, if: :password

  def password_confirmation_match
    errors.add(:password_confirmation, "doesn't match Password") if password != password_confirmation
  end

end
