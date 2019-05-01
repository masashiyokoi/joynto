class Channel < ApplicationRecord

  enum kind: {
    times: 1,
    direct_message: 2,
    project: 3,
  }

  acts_as_followable
end
