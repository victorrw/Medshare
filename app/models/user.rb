class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :meds
  has_many :shares

  # validates :name, presence: true, allow_nil: false, allow_blank: false
  # validates :email, presence: true, allow_nil: false, allow_blank: false
  # validates :zipcode, presence: true, allow_nil: false, allow_blank: false
  # validates :address, presence: true, allow_nil: false, allow_blank: false
end
