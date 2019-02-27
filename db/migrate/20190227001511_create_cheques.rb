class CreateCheques < ActiveRecord::Migration[5.2]
  def change
    create_table :cheques do |t|
      t.string :name
      t.datetime :date
      t.integer :value_cents, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
