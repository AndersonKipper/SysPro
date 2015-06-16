class User < ActiveRecord::Base
	validates :nome, presence: true
end
