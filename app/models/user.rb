class User < ActiveRecord::Base
	validates :nome, presence: true
	validates :email, format: /@/
	validates :password, presence: true
	has_many :projects
end
