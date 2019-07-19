require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
	end

	describe 'relationships' do
    it { should belong_to :owner }
		it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks)}
  end

	describe 'instance methods' do
		before :each do
			@owner = Owner.create(name: "Sam's Snacks")
			@dons  = @owner.machines.create(location: "Don's Mixed Drinks")

			@margarita = Snack.create!(name: "Margarita", price: 10.0)
			@daqueri = Snack.create!(name: "Daqueri", price: 8.0)
			@machine_snacks = @dons.machine_snacks.create!(snack_id: @margarita.id)
			@dons.snacks << @daqueri
		end
		it 'should return average price of snacks for machine' do
			expect(@dons.average_price.to_f).to eq(9.0)
		end
	end
end
