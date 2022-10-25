require_relative 'employee'

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super
        @employees = Array.new 
    end

    def bonus(multiplier)
        total = 0
        queue = @employees.dup 
        until queue.empty?
            temp_employee = queue.shift 
            total += temp_employee.salary
            if temp_employee.respond_to?(:employees)
                temp_employee.employees.each {|e| queue << e}
            end
        end
        return total * multiplier
    end

    def add_employee(employee)
        @employees << employee
    end
end