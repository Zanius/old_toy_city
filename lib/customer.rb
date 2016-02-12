class Customer
  attr_reader :name
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(customer_name)
    @@customers.select { |customer| customer.name == customer_name}[0]
  end


  private

  def add_to_customers
    @@customers << self
  end
end