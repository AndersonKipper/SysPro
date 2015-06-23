class User < ActiveRecord::Base
	validates :nome, presence: true
	validates :email, format: /@/
	validates :password, presence: true
	has_many :projects

	 def authenticate password
    #user = find_by_email(email)
    if self && self.password == password
      self
    else
      nil
    end
  end
end
