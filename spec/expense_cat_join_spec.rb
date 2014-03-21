require 'spec_helper'

describe 'Expense_cat' do
  it "should be initialized with category and purchase ids" do
    test_ec = Expense_cat.new(1, 2)
    test_ec.should be_an_instance_of Expense_cat
  end

  it "is initialized with category and purchase ids" do
    test_ec = Expense_cat.new(1, 2)
    test_ec.category_id.should eq 1
  end

  describe '.all' do
    it "starts with an empty array" do
      Expense_cat.all.should eq []
    end
  end
  describe '#save' do
    it "saves the new Expense_cat to the database" do
      test_ec = Expense_cat.new(1, 2)
      test_ec.save
      Expense_cat.all.should eq [test_ec]
    end
  end
  describe '==(another_ec)' do
    it "is the same Expense_cat if it is the same type" do
      test_ec = Expense_cat.new(1, 2)
      test_ec1 = Expense_cat.new(1, 2)
      test_ec.should eq test_ec1
    end
  end
  describe '.create' do
    it "initializes and saves a new Expense_cat" do
      test_ec = Expense_cat.create(1, 2)
      Expense_cat.all.should eq [test_ec]
    end
  end
end
