class User < ActiveRecord::Base
  has_secure_password

  before_save :format_username
  
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  validates :name, presence: true
  validates :email, presence: true, 
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false}

  validates :password, length: { minimum: 5, allow_blank: true }  

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }     

  
  scope :by_name, -> { order(:name) }
  scope :not_admins, -> { by_name.where(admin: false) }
  
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end

  def format_username
    self.username = username.downcase
  end

end
