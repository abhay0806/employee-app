class Employee < ApplicationRecord

	validates_numericality_of :phone, :on => create
  validates :image, allow_balnk: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: "must be a URL for png only" }

  def self.to_csv(make)
    employee_attributes = %w{name, email, address, phone, date_of_birth, image}
    employees = Employee.where(name: make)
    
    CSV.generate(header: true) do |csv|

      employees.each do |employee|
        csv << employee_attributes.map{ |emp| employee.send(emp)}
      end
    end
  end
end
