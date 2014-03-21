class Expense_cat
  attr_reader :category_id, :purchase_id, :id

  def initialize(category_id, purchase_id, id=nil)
    @id = id
    @category_id = category_id
    @purchase_id = purchase_id
  end

  def self.all
    @joins = []
    results = DB.exec("SELECT * FROM expense_cat;")
    results.each do |result|
      category_id = result['category_id'].to_i
      purchase_id = result['purchase_id'].to_i
      id = result['id'].to_i
      @joins << Expense_cat.new(category_id, purchase_id, id)
    end
    @joins
  end

  def self.create(category_id, purchase_id, id=nil)
    new_join = Expense_cat.new(category_id, purchase_id, id)
    new_join.save
    new_join
  end

  def save
    results = DB.exec("INSERT INTO expense_cat (category_id, purchase_id) VALUES (#{category_id}, #{purchase_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_join)
    self.category_id == another_join.category_id && self.purchase_id == another_join.purchase_id
  end
end
