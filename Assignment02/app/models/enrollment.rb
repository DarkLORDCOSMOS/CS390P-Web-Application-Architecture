class Enrollment < ApplicationRecord
  belongs_to :section
  belongs_to :student
  # def to_s
  #   "#{course.name} #{" - Section "} #{number} #{" - "} #{semester} #{" - "} #{student.name}"
  # end
end
