class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, timeout_in: 5.days, invite_for: 2.weeks
end
