require "byebug"
class Bootcamp
def initialize(name,slogan,student_capacity)
@name = name
@slogan = slogan
@student_capacity = student_capacity
@teachers = []
@students = []
@grades = Hash.new {|hash,k| hash[k]=[]}


end
def name
@name
end
def slogan
@slogan
end
def teachers
@teachers
end
def students
    @students
end
def hire(teach)
    teachers << teach
end
def enroll(stud)
if @student_capacity>students.length
    students << stud
    return true
else
    false
end
end
def enrolled?(stud)
students.include?(stud)
end
def student_to_teacher_ratio
    students.length/teachers.length
end
def add_grade(stud,grade)
    if enrolled?(stud)
    @grades[stud] << grade
    true    
else
    false
    end
end
def num_grades(stud)
    @grades[stud].length
end
def average_grade(stud)
    if @grades[stud].length>=1 && enrolled?(stud)
    @grades[stud].inject {|acc,ele| acc+ele}/@grades[stud].length
    else
        nil    
end
end
end