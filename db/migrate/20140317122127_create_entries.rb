class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :posting_date
      t.date :value_date
      t.string :concept
      t.string :amount
      t.string :office
      t.string :concept1

      t.timestamps
    end
  end
end
