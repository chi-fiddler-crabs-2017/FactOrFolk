class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

<<<<<<< HEAD
=======
  validates :email,  :presence => true
  validates :password,  :presence => true
  validates :email,  :uniqueness => true
  validates :username,  :presence => true
  validates :username,  :uniqueness => true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(email, password)
    authentic_email = (email == self.email)
    authentic_pwd = BCrypt::Password.new(self.hashed_password) == password
    authentic_pwd && authentic_email
  end
end
