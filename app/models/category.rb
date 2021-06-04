class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, presence: true, uniqueness: true
    belongs_to :user
end
