class Purchase
  attr_reader('id', 'description', 'amount', 'date', 'category_id', 'company_id')

  def initialize(purchase_hash)
    @id = purchase_hash['id'].to_i
    @description = purchase_hash['description']
    @amount = purchase_hash['amount']
    @date = purchase_hash['date']
    @category_id = purchase_hash['category_id'].to_i
    @company_id = purchase_hash['company_id'].to_i
  end

  def self.create(purchase_hash)
    new_purchase = Purchase.new(purchase_hash)
    new_purchase.save
    new_purchase
  end

  def save
    results = DB.exec("INSERT INTO purchase (description, amount, date, category_id, company_id) VALUES ('#{@description}', '#{@amount}', '#{date}', #{@category_id}, #{@company_id}) RETURNING id;")
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
    self.description == another_purchase.description && self.amount == another_purchase.amount && self.date == another_purchase.date && self.category_id == another_purchase.category_id &&
    self.company_id == another_purchase.company_id
  end


end

