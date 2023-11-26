require 'date'
class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendings, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendings, source: :event_attendee
    

    validates :title, presence: true
    validates :body, presence: true
    validates :date, presence: true
    validates :location, presence: true

    def self.past
        where(date: ...Date.today)
    end

    def self.future
        where(date:  Date.today..)
    end
end
