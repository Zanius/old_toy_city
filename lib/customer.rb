class Customer
  attr_reader :name, :purchase_history
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    @purchase_history = []
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(customer_name)
    @@customers.select { |customer| customer.name == customer_name}[0]
  end

  def purchase(product)
    Transaction.new(self, product)
  end

  def add_to_purchase_history(product)
    @purchase_history << product.title
  end

  private

  def add_to_customers
    if @@customers.detect{ |customer| customer.name == self.name}
      raise DuplicateCustomerError, "#{self.name} already exists."
    else
      @@customers << self
    end
  end
end