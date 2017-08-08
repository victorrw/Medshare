class Med < ApplicationRecord
  belongs_to :user
  belongs_to :share, optional: true

  def self.search(search)
    # search => "dorflex"
    where("UPPER(name) LIKE ?", "%#{search.upcase}%")
    # SELECT * FROM meds WHERE UPPER(name) LIKE "%DORFLEX%"
  end

#   validates :share, allow_nil: true
#   validates :name, presence: true, allow_nil: false, allow_blank: false
#   validates :exp_date, presence: true, allow_nil: false, allow_blank: false
 end
