class Candidate < ActiveRecord::Base
  has_many :votes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :party, presence: true
end
