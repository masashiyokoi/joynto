class Task < ApplicationRecord

  enum status: { ready: 1, doing: 2, done: 10 }

  belongs_to :user
  belongs_to :project
end
