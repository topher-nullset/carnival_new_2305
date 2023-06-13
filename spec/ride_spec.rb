require './spec/spec_helper'

RSpec.describe Ride do
  describe "#initialize" do
    it 'initializes a new Ride' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end

  describe "#board_rider" do
    it 'boards the rider if they are tall enough' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)

      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to include(visitor1)
    end

    it 'does not board the rider if they are not tall enough' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 44, admission_fee: 1, excitement: :gentle })
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor2.add_preference(:gentle)

      ride1.board_rider(visitor2)
      expect(ride1.rider_log).to eq({})
    end

    it 'does not board the rider if they are missing preference' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor2 = Visitor.new('Tucker', 36, '$5')

      ride1.board_rider(visitor2)
      expect(ride1.rider_log).to eq({})
    end

    it 'moves money from visitor spending money to total revenue' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      ride1.board_rider(visitor1)

      expect(ride1.total_revenue).to eq(1)
      expect(visitor1.spending_money).to eq(9)
    end
  end
end