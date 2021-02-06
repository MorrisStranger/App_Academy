class Employee
def intialize(name,title,salary,boss)
    @name, @title, @salary, @boss 
    = name,title,salary,boss
end
def bonus(multiplier)
bonus =@salary*multiplier
end
end

class Manager < Employee
def intialize(reports,name,title,salary,boss)
    @reports=reports
    super()
end
def bonus(multiplier)
    i=0
    bonus=0
    if @reports.boss == self
        
        i+=1
    @reports.inject{|acc,ele|acc.salary+ele.salary}*multiplier

end