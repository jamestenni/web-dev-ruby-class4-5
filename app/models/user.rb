class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true ##email can't be blank and have to be unique!
	validates :pass, presence: true
	validates :name, length: {minimum: 2}

	has_secure_password
	
	has_many :posts
end
