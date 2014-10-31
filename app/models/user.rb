class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities, inverse_of: :user
  has_many :start_signals, inverse_of: :user

  def full_name
    [first_name, last_name].join(" ")
  end
end
