class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :title, presence: true
    validates :body, presence: true
    validates :date, presence: true
    validates :location, presence: true
end
