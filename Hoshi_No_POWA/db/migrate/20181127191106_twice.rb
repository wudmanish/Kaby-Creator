class Twice < ActiveRecord::Migration[5.2]
     def up
  	create_table :Twice do |t|
  		t.string :Bomb
  		t.string :Cutter
  		t.string :Burn
  		t.string :Ice
  		t.string :Needle
  		t.string :Spark
  		t.string :Stone
  		
  	end
 end
  def down
  	drop_table :Twice
  end
end
