class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 100 }
  validates :user_id, presence: true
  validates :image_url, presence: true

  default_scope -> {order(updated_at: :desc)}

  mount_uploader :image_url, ImageUploader
end
