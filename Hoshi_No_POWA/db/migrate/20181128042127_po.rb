class Po < ActiveRecord::Migration[5.2]
   def up
    create_table :Po do |t|
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
    drop_table :Po
  end
end
