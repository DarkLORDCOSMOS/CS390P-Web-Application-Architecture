class Section < ApplicationRecord
  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, dependent: :destroy
  def name
    "#{course.name} #{" - Section "} #{number} #{" - "} #{semester}"
  end
end
