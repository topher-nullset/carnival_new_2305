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

# visitor1 = Visitor.new('Bruce', 54, '$10')
#  #<Visitor:0x000000015a16e918 @height=54, @name="Bruce", @preferences=[], @spending_money=10>

# visitor2 = Visitor.new('Tucker', 36, '$5')
#  #<Visitor:0x000000015a11c5c8 @height=36, @name="Tucker", @preferences=[], @spending_money=5>

# visitor1.add_preference(:gentle)

# visitor2.add_preference(:gentle)

# ride1.board_rider(visitor1)

# ride1.board_rider(visitor2)

# ride1.board_rider(visitor1)

# ride1.rider_log
#  {#<Visitor:0x000000015a16e918 @height=54, @name="Bruce", @preferences=[:gentle], @spending_money=8>=>2,
#  #<Visitor:0x000000015a11c5c8 @height=36, @name="Tucker", @preferences=[:gentle], @spending_money=4>=>1}

# visitor1.spending_money
#  8

# visitor2.spending_money
#  4

# ride1.total_revenue
#  3

# visitor3 = Visitor.new('Penny', 64, '$15')
#  #<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[], @spending_money=15>

# ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
#  #<Ride:0x0000000159a0cd00 @admission_fee=5, @excitement=:gentle, @min_height=36, @name="Ferris Wheel", @rider_log={}>

# ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
#  #<Ride:0x0000000159ae7a68 @admission_fee=2, @excitement=:thrilling, @min_height=54, @name="Roller Coaster", @rider_log={}>

# visitor2.add_preference(:thrilling)
#  [:gentle, :thrilling]

# visitor3.add_preference(:thrilling)
#  [:thrilling]

# ride3.board_rider(visitor1)

# ride3.board_rider(visitor2)

# ride3.board_rider(visitor3)

# visitor1.spending_money
#  8

# visitor2.spending_money
#  4

# visitor3.spending_money
#  13

# ride3.rider_log
#  {#<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[:thrilling], @spending_money=13>=>1}

# ride3.total_revenue
#  2
# ```