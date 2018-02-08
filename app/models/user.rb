class User
  include Mongoid::Document
  field :name, type: String
  field :auth_token, type: String
  
  before_create :generate_token

	validates :auth_token, uniqueness: true
	validates :name, presence: true, uniqueness: true

  protected

  def generate_token
    self.auth_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token if User.where(auth_token: random_token)
    end
  end
end
