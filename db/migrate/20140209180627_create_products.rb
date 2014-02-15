class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :prod_name
      t.hstore :properties

      t.timestamps
    end
  end
end
