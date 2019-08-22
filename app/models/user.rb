class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :collections, dependent: :destroy
  has_many :banks
  has_many :reviews, through: :collections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
