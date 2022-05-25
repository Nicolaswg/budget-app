class User < ApplicationRecord
  has_many :agreements, foreign_key: 'author_id', class_name: 'Agreement', dependent: :delete_all
  has_many :groups, foreign_key: 'author_id', class_name: 'Group', dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates :name, presence: true
end
