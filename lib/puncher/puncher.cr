class Puncher
  # this is a puncher
  # it punches
  # it can get punched

  @hit_points : Int32

  getter :name, :experience, :knocked_out
  property :hit_points

  def initialize(name : String)
    @name = name
    @hit_points = determine_hitpoints
    @experience = 0
    @knocked_out = false
  end

  def punch(target : Puncher)
    return if target == self
    report_status("#{@name} punched #{target.name}")
    target.get_punched(1)
    gain_experience
    report_status("#{@name} gained 1 experience")
  end

  def get_punched(punch_damage : Int32)
    @hit_points -= punch_damage
    report_status("#{@name} lost 1 hit points")
    gain_experience
    report_status("#{@name} gained 1 experience")
    check_status
  end

  def still_up?
    !@knocked_out
  end

  private def determine_hitpoints
    Random.rand(8) + 2
  end

  private def gain_experience
    @experience += 1
  end

  private def check_status
    return if @hit_points > 0
    @knocked_out = true
  end

  private def report_status(message : String)
    p message
  end
end
