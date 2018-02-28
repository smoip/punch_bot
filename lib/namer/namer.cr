class Namer
  def self.generate_name
    basic_name = "#{prefix.sample}#{root.sample}"
    return basic_name unless Random.new.next_bool
    "#{basic_name}#{suffix.sample}"
  end

  def self.prefix
    [
      "Ultra",
      "Mega",
      "Micro",
      "Mecha",
      "Neo",
      "Proto",
      "Hyper",
      "Holo",
      "Octa",
      "Roto",
      "Macro",
      "Exo",
    ]
  end

  def self.root
    [
      "bot",
      "droid",
      "drone",
      "noid",
      "tron",
      "drome",
      "vore",
      "comp",
    ]
  end

  def self.suffix
    [
      "-#{rand(99)}",
      "-#{rand(9)}000",
    ]
  end
end
