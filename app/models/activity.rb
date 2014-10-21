class Activity < ActiveRecord::Base
  belongs_to :user, inverse_of: :activities
end
