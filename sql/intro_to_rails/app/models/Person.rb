class Person < ApplicationRecord
    # validate(:check_name_length)
    validates :name, presence:true
    validates :house_id, presence:true
    def check_name_length
        unless self.name.size >=3
            errors[:name] << "is too short"
        end
    end
    belongs_to :house,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
        # optional:true
    
end