class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_zone
  belongs_to :user
  belongs_to :team

  with_options presence: true do
    validates :time_zone_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :scheduled_date, uniqueness: { scope: [:time_zone_id, :team_id] }
    validates :user_id
  end
end
