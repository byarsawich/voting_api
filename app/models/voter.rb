require 'securerandom'

class Voter < ActiveRecord::Base
  before_create :generate_token, unless: :token?
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :party, presence: true
  
  private def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
