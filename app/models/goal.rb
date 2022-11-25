class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_rich_text :description
end
