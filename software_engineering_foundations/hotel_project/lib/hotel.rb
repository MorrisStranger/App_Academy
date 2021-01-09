require_relative "room"
require "byebug"
class Hotel
    def initialize(name,room_details)  
        @name = name
        @rooms={}
        room_details.each{|k,v| @rooms[k]=Room.new(v)}
    end
    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end
    def rooms
        @rooms
    end
    def room_exists?(room_name)
        self.rooms.include?(room_name)

    end
def check_in(person,room_name)
    if self.room_exists?(room_name)
         
        if rooms[room_name].add_occupant(person)
            p "check in successful"

            # rooms[room_name].add_occupant(person)

        else
            p "sorry, room is full"
        end
    else
         p "sorry, room does not exist"
    end
end
    def has_vacancy?
        # debugger
        @rooms.values.any? {|v| v.available_space>0}
    end
def list_rooms
    self.rooms.each do |k,v| 
        p "#{k} : #{v.available_space}"
    end
end
end
