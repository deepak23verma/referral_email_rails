class Referral < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :user_id

  validates :email, :first_name, :last_name presence: true
  belongs_to :user
end
