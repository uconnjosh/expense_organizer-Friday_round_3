class Purchase
  attr_reader('id', 'description', 'amount', 'date')

  def initialize(purchase_hash)
    @id = purchase_hash['id'].to_i
    @description = purchase_hash['description']
    @amount = purchase_hash['amount']
    @date = purchase_hash['date']
  end

  def self.create(purchase_hash)
    new_purchase = Purchase.new(purchase_hash)
    new_purchase.save
    new_purchase
  end

  def save
    results = DB.exec("INSERT INTO purchase (description, amount, date) VALUES ('#{@description}', '#{@amount}', '#{date}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    purchases = []
    results = DB.exec("SELECT * FROM purchase;")
    results.each do |result|
      purchases << Purchase.new(result)
    end
    purchases
  end

  def ==(another_purchase)
    self.description == another_purchase.description && self.amount == another_purchase.amount && self.date == another_purchase.date
  end


end

