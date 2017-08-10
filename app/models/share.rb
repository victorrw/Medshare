class Share < ApplicationRecord
  belongs_to :taker, :class_name => "User"
  has_one :med
  has_one :giver, through: :med, source: :user

  # # validates :med, presence: true
  # # validates :giver, presence:true
  # # validates :taker, presence:true
end
