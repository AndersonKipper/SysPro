class Project < ActiveRecord::Base
	has_many :tasks
	has_many :forums
	belongs_to :user
end
