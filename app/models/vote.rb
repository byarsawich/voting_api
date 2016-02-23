class Vote < ActiveRecord::Base
  belongs_to :candidate
  # belongs_to :voter
  # validate :voter_id, uniqueness: true
end
