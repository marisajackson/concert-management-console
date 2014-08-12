class CreateConcerts < ActiveRecord::Migration
	def change
		create_table :concerts do |t|
			t.string :headliner
			t.string :venue
			t.datetime :date
			t.integer :profit
			t.references :expenses
		end
	end
end