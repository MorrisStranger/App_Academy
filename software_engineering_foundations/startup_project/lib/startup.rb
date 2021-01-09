require "employee"


class Startup
attr_reader :name,:funding,:salaries,:employees
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end
    def valid_title?(title)
        @salaries.has_key?(title)
    end
    def >(startup)
    self.funding>startup.funding
    end
    def hire(employee_name,title)
        if self.valid_title?(title)
        # Employee.new(employee_name,title)
        @employees << Employee.new(employee_name,title)

    
    else
        raise "this is not a valid title"
    end
    end
    def size
        @employees.length
    
    end
    def pay_employee(employee)
        money_owed = @salaries[employee.title]
        if @funding >= money_owed
        employee.pay(money_owed)
        @funding -= money_owed
        else

            raise "not enough funding!"
        end
end
def payday
@employees.each {|employee| self.pay_employee(employee)}
end
def average_salary
    sum=0
    @employees.each do |employee|
    sum+=@salaries[employee.title]
    end
sum/@employees.length
end
def close
@employees=[]
@funding =0
end
def acquire(startup)
@funding+=startup.funding
startup.salaries.each {|title,salary| @salaries[title]=salary if !@salaries.has_key?(title)} 
startup.employees.each{|employee| @employees << employee}
startup.close
end
end
