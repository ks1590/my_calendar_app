class Event < ApplicationRecord
  belongs_to :payment
  belongs_to :category

  current_week = Date.today.all_week
  current_month = Date.today
  current_year = Date.today.all_year

  scope :current_week, -> { where(date: current_week)}
  scope :current_month, -> { where(date: current_month.beginning_of_month..current_month.end_of_month) }
  scope :last_month, -> { where(date: current_month.prev_month.beginning_of_month..current_month.prev_month.end_of_month) }
  scope :current_year, -> { where(date: current_year)}
end
