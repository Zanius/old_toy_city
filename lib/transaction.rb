class Transaction
  attr_reader :customer, :product, :id
  @@transactions = []
  @@count = 0
  
  def initialize(customer, product)
    @customer = Customer.find_by_name(customer.name)
    @product = Product.find_by_title(product.title)
    @id = @@count + 1
    @@count += 1
    add_to_transactions
    @product.lower_stock
  end


  def self.all
    @@transactions
  end

  def to_s
    "Transaction id: #{@id}, customer: #{@customer.name}, product: #{@product.title}"
  end

  def self.find(transaction_id)
    @@transactions.select { |transaction| transaction.id == transaction_id}[0]
  end

  private

  def add_to_transactions
    @@transactions << self
  end
end