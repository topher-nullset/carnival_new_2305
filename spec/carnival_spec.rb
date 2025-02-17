require './spec/spec_helper'

RSpec.describe Carnival do
  describe "#initialize" do
    it 'sets the duration and rides' do
      carnival = Carnival.new(14, [])

      expect(carnival.duration).to eq(14)
      expect(carnival.rides).to eq([])
    end
  end

  describe "#most_popular_ride" do
    it 'returns the most popular ride' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      carnival = Carnival.new(14, [ride1, ride2])

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor2.add_preference(:gentle)
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor3.add_preference(:gentle)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor3)

      expect(carnival.most_popular_ride).to eq(ride1)
    end
  end

  describe "#most_profitable_ride" do
    it 'returns the most profitable ride' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival = Carnival.new(14, [ride1, ride2])

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor2.add_preference(:thrilling)
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride2.board_rider(visitor3)

      expect(carnival.most_profitable_ride).to eq(ride2)
    end
  end
  
  describe "#total_revenue" do
    it 'returns the total revenue earned from all rides' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival = Carnival.new(14, [ride1, ride2, ride3])

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor2.add_preference(:gentle)
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride3.board_rider(visitor3)

      expect(carnival.total_revenue).to eq(8)
    end
  end
end