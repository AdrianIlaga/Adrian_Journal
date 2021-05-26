class Task < ApplicationRecord
    belongs_to :category

    validates :title, presence: true,
                      uniqueness: true

    validates :priority, presence: true, inclusion: { in: (1..5), message: "Must be an integer between 1 to 5" }

    after_initialize :default_values

    private

    def default_values
    self.completed ||= false
    end

end
