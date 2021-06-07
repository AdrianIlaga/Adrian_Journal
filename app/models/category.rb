class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, presence: true, uniqueness: {scope: :user_id}
    belongs_to :user
end
