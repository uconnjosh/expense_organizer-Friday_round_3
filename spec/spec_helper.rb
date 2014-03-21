require 'rspec'
require 'pg'
require 'purchase'
require 'category'
require 'company'

DB = PG.connect(:dbname => 'expense_organizer_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM purchase *;")
    DB.exec("DELETE FROM category *;")
    DB.exec("DELETE FROM company *;")
  end
end
