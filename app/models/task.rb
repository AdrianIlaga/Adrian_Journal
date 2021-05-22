class Task < ApplicationRecord

    validates :title, presence: true,
                      uniqueness: true

    validates :priority, presence: true, inclusion: { in: (1..5), message: "Must be an integer between 1 to 5" }

    validates :category_id, presence: true

end
