class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter, uniqueness: true
end
