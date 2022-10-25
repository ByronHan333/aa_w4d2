require_relative 'manager'
require_relative 'employee'

ned = Manager.new('ned', 'founder', 1000000, nil)
darren = Manager.new('darren', 'manager', 78000, ned)
david = Employee.new('david', 'ta', 10000, darren)
shawna = Employee.new('shawna', 'ta', 12000, darren)

darren.add_employee(david)
darren.add_employee(shawna)

ned.add_employee(darren)

p david.bonus(3)
p darren.bonus(4)
p ned.bonus(5)

