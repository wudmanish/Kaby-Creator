class Kirb < ActiveRecord::Migration[5.2]
    def up
    create_table :kirb do |t|
      t.string :Crystal
      t.string :Dreamland
      t.string :Superstar
  end
end
  def down
    drop_table :kirb
  end
end
