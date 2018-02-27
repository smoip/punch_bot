class PunchingPlace
  # this is punching place
  # it's a place to punch

  def initialize(punchers : Array(Puncher))
    @punchers = punchers
  end

  def punch_fight
    while all_still_up?
      @punchers.first.punch(@punchers.last)
      @punchers.last.punch(@punchers.first)
    end
    p "Knock out!"
    p "First HP: #{@punchers.first.hit_points}, First Exp: #{@punchers.first.experience}"
    p "Second HP: #{@punchers.last.hit_points}, Second Exp: #{@punchers.last.experience}"
  end

  private def all_still_up?
    @punchers.map { |puncher| puncher.still_up? }.reduce { |acc, bool| acc && bool }
  end
end
