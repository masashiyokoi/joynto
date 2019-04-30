class Channel::Direct < Channel
  has_many :messages, :as => :messageable
end
