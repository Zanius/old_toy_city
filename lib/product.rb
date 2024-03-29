class Product
  attr_reader :title, :price, :stock
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(product_title)
    @@products.select { |product| product.title == product_title}[0]
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@products.select {|product| product.stock > 0}
  end

  def lower_stock
    if @stock <= 0
      raise OutOfStockError, "#{@title} is out of stock."
    else
      @stock -= 1
    end
  end

  private

  def add_to_products
    if @@products.detect{ |product| product.title == self.title}
      raise DuplicateProductError, "#{self.title} already exists."
    else
      @@products << self
    end
  end
end

