require "./punch_bot/*"
require "../lib/puncher"
require "../lib/punching_place"

# TODO: Write documentation for `PunchBot`
module PunchBot
  punchy = Puncher.new()
  fisty = Puncher.new()
  arena = PunchingPlace.new([punchy, fisty])
  arena.punch_fight
end
