# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.4.1

* System dependencies

* Configuration

* Database creation
```
CREATE DATABASE post_production CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'post'@'localhost' IDENTIFIED BY 'xxxxxxxxxxx';
GRANT ALL PRIVILEGES ON post_production.* TO 'post'@'localhost';
FLUSH PRIVILEGES;
```

* Database initialization
```
RAILS_ENV=production bundle exec rails db:seed
```

* Deployment instructions
```
mina deploy
```


*********
## rails generate code

```
rails generate scaffold income code:index:uniq payer:references abstract bill_date:date account_date:date 'income_amount:decimal{10,2}' 'settlement_amount:decimal{10,2}' invoice_date:date invoice_num:integer 'tax_rate:decimal{2,0}' explain 'discount_rate:decimal{2,0}' 'available_amount:decimal{10,2}' 

rails generate scaffold payee code:index name brief_name status:integer

rails generate scaffold cost no:index payee:references income:references abstract invoice_date:date 'tax_rate:decimal{2,0}' 'invoice_amount:decimal{10,2}' cost_date:date 'cost_amount:decimal{10,2}' explain

rails generate migration RenameNoColumnName




rails generate scaffold Fee begin_date:date end_date:date 'income_amount:decimal{10,2}' 'fee_amount:decimal{10,2}' 'part_amount1:decimal{10,2}'  'percent1:decimal{3,1}' 'part_amount2:decimal{10,2}'  'percent2:decimal{3,1}'

rails generate model FeeIncomeList fee:references income:references
rails generate model FeeDetail fee:references income:references 'fee_amount:decimal{10,2}'
rails generate migration DropFeeIncomeListsTable
rails generate migration DropFeeDetailsTable
rails generate migration AddFeeColumnToIncomes
rails generate migration AddExtractFeeFlagColumnToIncomes

rails generate model FeeDetail fee:references income:references 'fee_amount:decimal{10,2}'






rails generate model revenue income:references date:date 'amount:decimal{10,2}'
rails generate model payment cost:references date:date 'amount:decimal{10,2}'
```