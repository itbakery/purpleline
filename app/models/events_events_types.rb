class EventsEventsTypes < ActiveRecord::Base
    belongs_to  :event
    belongs_to  :events_type
end
