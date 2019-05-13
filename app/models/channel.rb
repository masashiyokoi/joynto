class Channel < ApplicationRecord

  enum kind: {
    times: 1,
    direct_message: 2,
    project: 3,
  }

  has_many :messages

  acts_as_followable

  def self.create_direct(users)
    channel = self.create(
      kind: :direct_message
    )

    users.each do |user|
      user.follow channel
    end
  end
end
