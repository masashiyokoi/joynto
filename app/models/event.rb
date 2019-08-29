class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :project
end
