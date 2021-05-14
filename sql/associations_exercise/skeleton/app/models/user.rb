class User < ApplicationRecord
    #enrollments and enrolled_courses
    #enrollments we want to get the enrollment objects
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment
        
    has_many :enrolled_courses,
        through: :enrollments,
        source: :course
        
        
    
    end
