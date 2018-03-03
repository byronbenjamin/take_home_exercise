class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :loan, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2
      t.datetime :payment_date

      t.timestamps
    end
  end
end
