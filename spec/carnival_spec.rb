require './spec/spec_helper'

RSpec.describe Carnival do
  describe "#initialize" do
    it 'sets the duration and rides' do
      carnival = Carnival.new(14, [])

      expect(carnival.duration).to eq(14)
      expect(carnival.rides).to eq([])
    end
  end
end