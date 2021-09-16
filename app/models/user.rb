class User < ApplicationRecord
	validates :email, presence: true ##MUST HAVE EMAIL TO SAVE
	validates :name, length: {minimum: 2} #
end
