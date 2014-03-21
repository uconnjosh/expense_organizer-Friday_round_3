require 'spec_helper'

describe Purchase do
  describe '#initialize' do
    it 'should initialize new instance of Purchase' do
      test_purchase = Purchase.new({'id' => 3, 'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      test_purchase.should be_an_instance_of Purchase
    end

    it 'returns that values of the instance variables' do
      test_purchase = Purchase.new({'id' => 3, 'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      test_purchase.description.should eq 'burger'
      test_purchase.amount.should eq '$5.00'
      test_purchase.date.should eq '2003-04-12 04:05:06'
      test_purchase.category_id.should eq 1
      test_purchase.company_id.should eq 2
      test_purchase.id.should be_an_instance_of Fixnum
    end
  end

  describe 'create' do
    it 'Saves a new instance of Purchase' do
      test_purchase = Purchase.create({'id' => 3, 'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      Purchase.all.should eq [test_purchase]
    end
  end

  describe '#save' do
    it 'saves a new instance of Purchase' do
      test_purchase = Purchase.new({'id' => 3, 'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      test_purchase.save
      Purchase.all.should eq [test_purchase]
    end
  end

  describe '.all' do
    it 'returns the stored objects of the Purchase class' do
      test_purchase = Purchase.new({'id' => 3, 'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      test_purchase.save
      Purchase.all.should eq [test_purchase]
    end
  end

  describe '#==' do
    it 'recognizes that two instances are equal if their values are the same' do
      test_purchase1 = Purchase.create({'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      test_purchase2 = Purchase.create({'description' => 'burger', 'amount' => '$5.00', 'date' => '2003-04-12 04:05:06', 'category_id' => 1, 'company_id' => 2})
      test_purchase1.should eq test_purchase2
    end
  end



end

