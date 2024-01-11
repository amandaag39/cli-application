# character.rb
class Character
  attr_accessor :name, :race, :character_class, :weapon

  def initialize(name, race, character_class, weapon)
    @name = name
    @race = race
    @character_class = character_class
    @weapon = weapon
  end
end
