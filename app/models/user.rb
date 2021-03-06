class User < ActiveRecord::Base
	has_secure_password

	has_many :price_queries, dependent: :destroy

	validates :email,
		presence: true,
		uniqueness: {case_sensitive: false},
		:format => {:with => /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/}
	
	validates :password,
		presence: true,
		confirmation: true,
		length: {minimum: 6},
		on: :create

	validates :first_name, presence: true

	validates :last_name, presence: true

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end

end