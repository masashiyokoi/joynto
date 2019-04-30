class Channel::Project < Channel
  has_many :messages, :as => :messageable
end
