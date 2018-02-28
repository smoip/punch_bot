require "../namer"
# add levels
# variable attack power
# variable defense power

# when you take damage - you get 1 experience
# when you do damage - you get experience based on the level of the bot you damaged

# add bot name generator
class Puncher
  # this is a puncher
  # it punches
  # it can get punched

  @@level_base : Int32 = 5
  @max_hit_points : Int32
  @current_hit_points : Int32
  @level : Int32
  @name : String

  getter :name, :experience, :level, :knocked_out
  property :hit_points

  def initialize()
    @name = Namer.generate_name
    @max_hit_points = determine_hitpoints
    @current_hit_points = @max_hit_points
    @experience = 0
    @level = 0
    @attack = 1
    @defense = 1
    @knocked_out = false
  end

  def punch(target : Puncher)
    return if target == self
    return miss(target.name) unless hit?
    report_message("#{@name} punched #{target.name}")
    target.get_punched(min_amount_for(@level))
    gain_experience(min_amount_for(target.level))
  end

  def miss(target_name : String)
    report_message("#{@name} missed #{target_name}")
  end

  def get_punched(punch_damage : Int32)
    @current_hit_points -= punch_damage
    report_message("#{@name} lost #{punch_damage} hit points")
    gain_experience(1)
    check_status
  end

  def still_up?
    !@knocked_out
  end

  def report_status
    report_message("#{@name}: Level #{@level}, Exp. #{@experience}, HP #{@current_hit_points}/#{@max_hit_points}")
  end

  private def determine_hitpoints
    Random.rand(8) + 2
  end

  private def min_amount_for(level)
    [level, 1].max
  end

  private def hit?
    rand > 0.5
  end

  private def gain_experience(points)
    @experience += points
    report_message("#{@name} gained #{points} experience")
    update_level
  end

  private def check_status
    return if @current_hit_points > 0
    @knocked_out = true
  end

  private def report_message(message : String)
    p message
  end

  private def update_level
    initial_level = @level
    @level = calculate_level
    if @level > initial_level
      report_message("#{@name} leveled up to #{@level}!")
      improve_attrs
    end
  end

  private def improve_attrs
    @max_hit_points += determine_hitpoints
  end

  private def calculate_level
    Int32.new(LibM.log_f64(@experience) / LibM.log_f64(@@level_base))
  end
end
