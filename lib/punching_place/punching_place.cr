# add teams
# all bots are on teams
# bots choose a random opponent from another team to attack
# fight ends when only members of one team are left

class PunchingPlace
  # this is a punching place
  # it's a place to punch

  def initialize(punchers : Array(Puncher))
    @punchers = punchers
  end

  def punch_fight
    while all_still_up?
      @punchers.first.punch(@punchers.last)
      @punchers.last.punch(@punchers.first)
      p ""
    end
    p "Knock out!"
    @punchers.each { |puncher| puncher.report_status }
  end

  private def all_still_up?
    @punchers.map { |puncher| puncher.still_up? }.reduce { |acc, bool| acc && bool }
  end
end
