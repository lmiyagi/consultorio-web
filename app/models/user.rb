class User < ApplicationRecord
  attr_accessor :show_token
  has_many :appointments, foreign_key: :patient_id, class_name: "Appointment", dependent: :destroy

  validates :cns, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(authentication_token: token)
    token
  end

  def invalidate_auth_token
    self.update_columns(authentication_token: nil)
  end
end
