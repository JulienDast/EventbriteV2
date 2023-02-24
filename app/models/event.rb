class Event < ApplicationRecord
  belongs_to :admin, class_name:'User'
  has_many :attendances
  has_many :users, through: :attendances
  


  validates :start_date, presence: true
  validates :title, presence: true, length:{in:5..140}
  validates :description, presence: true, length:{in:20..1000}
  validates :price, presence: true, numericality:{in:1..1000}
  validates :location, presence: true
  validates :duration, presence: true
end
