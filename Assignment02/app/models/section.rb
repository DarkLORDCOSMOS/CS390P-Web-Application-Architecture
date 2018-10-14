class Section < ApplicationRecord
  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, dependent: :destroy
  def name
    "#{course.name} #{" - Section "} #{number} #{" - "} #{semester}"
  end
  validates :course, 		presence: true, 
							length: { maximum: 50, message: "must be less than 50 characters in length" }
  validates :semester, 		presence: true, 
                            format: { with: /\A\w{4,6}\s\d{4}\z/, message: "should be in the form [Season] [Year]" },
							length: { maximum: 11, message: "must be less than 11 characters in length" }
  validates :number, 		presence: true,
                            format: { with: /\A[0-9]/, message: "only allows numbers" },
							numericality: { greater_than_or_equal_to: 1, 
							                less_than_or_equal_to: 4, 
											message: "must be between 1 and 4" },
							length: { is: 1 }
  validates :room_number, 	presence: true, 
                            format: { with: /\A[0-9]/, message: "only allows numbers" },
							numericality: { greater_than_or_equal_to: 100, 
							                less_than_or_equal_to: 600, 
											message: "must be between 100 and 600" },
							length: { is: 3 }
end
