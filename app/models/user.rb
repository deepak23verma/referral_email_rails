class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_many :referrals
end
