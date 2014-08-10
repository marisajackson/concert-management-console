class CreateConcerts < ActiveRecord::Migration
	def change
		create_table :concerts do |t|
			t.string :headliner
			t.string :venue
			t.datetime :date
		end
	end
end