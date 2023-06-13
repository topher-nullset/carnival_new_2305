require './spec/spec_helper'

RSpec.describe Visitor do

  describe "#initialize" do
    it 'sets new attributes' do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1.name).to eq('Bruce')
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq('$10')
      expect(visitor1.preferences).to eq([])
    end
  end

  describe "#add_preferences" do
    it 'can add preferences' do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1.preferences).to eq([])
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)
      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe "#tall_enough?" do
    it 'returns true if the visitor is tall enough' do
  end
end

  


# visitor2 = Visitor.new('Tucker', 36, '$5')
# #=> #<Visitor:0x000000012f1f30f8 @height=36, @name="Tucker", @preferences=[], @spending_money=5>

# visitor3 = Visitor.new('Penny', 64, '$15')
# #=> #<Visitor:0x000000012f176760 @height=64, @name="Penny", @preferences=[], @spending_money=15>

# visitor1.tall_enough?(54)
# #=> true

# visitor2.tall_enough?(54)
# #=> false

# visitor3.tall_enough?(54)
# #=> true

# visitor1.tall_enough?(64)
# #=> false
