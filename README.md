Railscast sm-rc345
===================
HStore
```
If we want to have hash of values for single column in postgres, hstore is your chioce
```
git clone
```
git clone 'https://github.com/sweetymehta/sm-rc345.git'
```
basic step
```
setup postgresql database server
rake db:create
gem 'activerecord-postgres-hstore' in gemfile
bundle install
```
hstore migration creation
```
rails g hstore:setup
```
Rest of setup
```
rake db:migrate
rails g bootstrap:install
rails g simple_form:install
```
scaffold
```
#todo
rake db:migrate
rails g bootstrap:themed orders -f
````
Making a column as hash of attributes
```
rails g scaffold product prod_name properties:hstore
```
To add index to column
```
rails g migration index_products_properties
sudo apt-get install postgresql-contrib   because of error 'could not open extension control file'

```
rails c
```
p = Product.first
p.properties = {color: 'fair', company: 'microsoft', place: 'USA'}
p.save
Now properties can save many values and easly fetchable
```
Query on hstore
```
Product.where("properties -> 'company' = 'microsoft'")
Product.where("properties -> 'company' LIKE 'micr%'")
```
Note
```
Hstore can only save string, so chage manually if need to store integer and or any
```
So for changing it to integer
```
Product.last.update_attributes(properties: {rate: 111})
Product.where("(properties -> 'rate')::int > 110")
```
To add more value in exting hstore values
```
p.properties = (p.properties || {}).merge({company: 'newspaper'})
```
Rails Server
```
rails s
```