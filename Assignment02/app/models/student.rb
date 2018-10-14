class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :sections, through: :enrollments, dependent: :destroy
  validates :name, presence: true, 
                   format: { with: /\A[a-zA-Z a-zA-Z]+\z/, message: "only allows letters" },
				   length: { maximum: 50, message: "must be less than 50 characters in length" }
end
