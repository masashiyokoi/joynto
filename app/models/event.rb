class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :project

  scope :before_start, ->() { where("start_time >= :date", date: Time.zone.now) }
end
