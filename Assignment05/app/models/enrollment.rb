class Enrollment < ApplicationRecord
  belongs_to :section
  belongs_to :student
  validates :section, 	presence: true, 
						length: { maximum: 50, message: "must be less than 50 characters in length" }
  validates :student, 	presence: true, 
						length: { maximum: 50, message: "must be less than 50 characters in length" }
end
