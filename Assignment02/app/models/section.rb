class Section < ApplicationRecord
  belongs_to :course
  has_many :enrollments
  has_many :students, through: :enrollments
  def to_s
    "#{course.name} #{" - Section "} #{number} #{" - "} #{semester}"
  end
end
