class Show < ActiveRecord::Base
  scope :upcoming, -> { where('date > ?', 1.day.ago) }
  scope :by_date, -> { order(date: :asc) }
end
