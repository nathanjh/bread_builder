class User < ActiveRecord::Base
  # validates_presence_of :first_name
  # validates_presence_of :last_name
  validates_presence_of :username, :password, :email
  validates_uniqueness_of :username, :email
  validates :password, confirmation: { case_sensitive: false }

  has_many :recipes_users
  has_many :recipes, through: :recipes_users

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    return @user if @user && @user.password == password
  end
end
