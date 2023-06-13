class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement,
              :rider_log,
              :total_revenue

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = {}
    @total_revenue = 0
  end

  def board_rider(visitor)
    return unless can_board?(visitor)

    visitor.spending_money -= admission_fee
    @rider_log[visitor] ||= 0
    @rider_log[visitor] += 1
    @total_revenue += admission_fee
  end

  private

  def can_board?(visitor)
    visitor.tall_enough?(min_height) && visitor.preferences.include?(excitement) && visitor.spending_money >= admission_fee
  end
end