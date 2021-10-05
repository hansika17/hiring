class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, and :omniauthable
  has_and_belongs_to_many :skills
  belongs_to :discipline
  belongs_to :role
  belongs_to :job
  scope :all_users, -> { includes(:job, :role, :discipline).order(:first_name) }
  scope :available, -> { all_users }
  has_and_belongs_to_many :people_tags
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, timeout_in: 5.days, invite_for: 2.weeks
end
