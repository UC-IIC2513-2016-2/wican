class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :ongs

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[a-zA-Z0-9_\.\+-]+@(?:[a-zA-Z0-9_-]+\.){1,}[a-zA-Z0-9_-]{2,5}\z/,
      allow_blank: true
    }
  validates :password, presence: {on: :create}, length: { minimum: 6, allow_blank: true }, confirmation: true
  validates :first_name, presence: true, length: { minimum: 2, allow_blank: true }
  validates :last_name, presence: true, length: { minimum: 2, allow_blank: true }
  validates :token, uniqueness: true

  def full_name
    @full_name ||= "#{first_name} #{last_name}"
  end

  def generate_token_and_save
    loop do
      self.token = SecureRandom.hex(64)
      break if self.save
    end
  end

end
