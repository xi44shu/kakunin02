class Showschedule < ApplicationRecord
  belongs_to :public_utility
  belongs_to :schedule
  belongs_to :trading_company
  belongs_to :user

end
