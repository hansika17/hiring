class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, and :omniauthable
  scope :all_users, -> { order(:first_name) }
  scope :available, -> { all_users }
end
