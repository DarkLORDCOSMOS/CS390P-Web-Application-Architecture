class Course < ApplicationRecord
  has_many :sections, dependent: :destroy
  validates :name, 			presence: true,
                        format: { with: /\A[a-zA-Z a-zA-Z]+\z/, message: "only allows letters" },
							          length: { maximum: 50, message: "must be less than 50 characters in length" }
  validates :department, presence: true,
                        format: { with: /\A[A-Z]/, message: "only allows capital letters" },
							           length: { is: 3 }
  validates :number, 		presence: true,
                            format: { with: /\A[0-9]/, message: "only allows numbers" },
							            numericality: { greater_than: 1000,
							                less_than_or_equal_to: 5000,
										      message: "must be between 1000 and 5000" },
							                   length: { is: 4 }
  validates :credit_hours, 	presence: true,
                            format: { with: /\A[0-9]/, message: "only allows numbers" },
							numericality: { greater_than: 0,
							                less_than_or_equal_to: 6,
											message: "must be between 1 and 6" },
							length: { is: 1 }
end
