class Showschedule < ApplicationRecord
  belongs_to :user
  belongs_to :trading_company
  belongs_to :schedule
  # belongs_to :public_utility
  validates :schedule_id, uniqueness: true

end
