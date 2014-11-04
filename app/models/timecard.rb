class Timecard < ActiveRecord::Base
  belongs_to :location, inverse_of: :timecards
  belongs_to :user, inverse_of: :timecards
  belongs_to :activity, inverse_of: :timecard
  validates :location, presence: true
  validates :user, presence: true
  validates :start_time, presence: true
  validates :stop_time, presence: true, on: :update

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def elapsed_seconds
    stop_time - start_time
  end

  def elapsed_rounded_hours
    (elapsed_hours * 4).round / 4.0
  end

  def publish_activity
    activity = user.activities.create(location_id: location.id, date: stop_time.to_date, hours: elapsed_rounded_hours, description: notes)
    update_attributes({activity_id: activity.id, published: true}) if activity.save!
  end

  private

  def elapsed_hours
    (elapsed_seconds / 3600).round(2)
  end
end
