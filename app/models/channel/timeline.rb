class Channel::Timeline < Channel
  has_many :messages, :as => :messageable
end
