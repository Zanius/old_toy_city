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
    @customer.add_to_purchase_history(product)
  end


  def self.all
    @@transactions
  end

  #When a purchase is made this displays information about the transaction
  def to_s
    "------\nA new purchase has been made:\nTransaction id: #{@id}, customer: #{@customer.name}, product: #{@product.title}\n------"
  end

  def self.find(transaction_id)
    @@transactions.select { |transaction| transaction.id == transaction_id}[0]
  end

  private

  def add_to_transactions
    @@transactions << self
  end
end