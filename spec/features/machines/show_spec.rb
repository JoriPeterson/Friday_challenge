require 'rails_helper'

RSpec.describe 'Machine Show Page' do
	describe 'As a user' do
		before :each do
			@owner = Owner.create(name: "Sam's Snacks")
	    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

			@margarita = Snack.create!(name: "Margarita", price: 10.0)
			@daqueri = Snack.create!(name: "Daqueri", price: 8.0)
			@machine_snacks = @dons.machine_snacks.create!(snack_id: @margarita.id)
			@dons.snacks << @daqueri
		end
		describe 'When I visit a machines show page' do
			it 'I see a name of all snacks for that machine and price' do

				visit machine_path(@dons)

				within "#snack-#{@margarita.id}" do
					expect(page).to have_content("Margarita")
					expect(page).to have_content(@margarita.price)
				end

				within "#snack-#{@daqueri.id}" do
					expect(page).to have_content("Daqueri")
					expect(page).to have_content(@daqueri.price)
					expect(page).to have_content("Average Price: $9.00")
				end
			end
		end
	end
end
