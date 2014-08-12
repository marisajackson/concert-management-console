class CreateIncomes < ActiveRecord::Migration
	def change
		create_table :incomes do |t|
			t.string :name
			t.integer :amount
			t.references :concert
		end
	end
end