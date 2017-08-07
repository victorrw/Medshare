class Med < ApplicationRecord
  belongs_to :user
  belongs_to :share

#   validates :share, allow_nil: true
#   validates :name, presence: true, allow_nil: false, allow_blank: false
#   validates :exp_date, presence: true, allow_nil: false, allow_blank: false
 end
