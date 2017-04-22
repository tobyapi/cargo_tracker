require "./*"
require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  class RouteSpecification < Specification(Itinerary)
    getter origin : Location::Location
    getter destination : Location::Location
    getter arrival_deadline : Time

    def_equals @origin, @destination, @arrival_deadline

    def initialize(@origin, @destination, @arrival_deadline); end

    def is_satisfied_by?(itinerary : Itinerary)
      origin == itinerary.initial_departure_location &&
      destination == itinerary.final_arrival_location &&
      itinerary.final_arrival_date <= arrival_deadline
    end
  end
end
