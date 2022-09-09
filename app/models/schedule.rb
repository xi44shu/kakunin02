class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_zone
  belongs_to :user
  belongs_to :team

  validates :time_zone_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
end
