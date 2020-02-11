class Event < ApplicationRecord
  include PublicActivity::Model
  belongs_to :owner, class_name: 'User'
  belongs_to :project
  tracked

  scope :before_start, ->() { where("start_time >= :date", date: Time.zone.now) }
  scope :finished, ->() { where("end_datetime <= :date", date: Time.zone.now) }
end
