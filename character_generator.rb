#character_generator.rb
require_relative "character"

class CharacterGenerator
  def run
    @character = generate_character
    display_character_details
  end

  RACES = ["Human", "Elf", "Dwarf", "Hobbit"]
  CLASSES = ["Warrior", "Wizard", "Ranger", "Theif", "Gardener"] 
  WEAPONS = ["Sword", "Staff", "Bow", "Dagger", "Rocks"]

  def generate_character
    name = generate_name
    race = RACES.sample
    character_class = CLASSES.sample
    weapon = WEAPONS.sample
    
    Character.new(name, race, character_class, weapon)
  end
  
  private
  PREFIXES = ["Ara", "Eli", "Gim", "Fro", "Sam", "Leg", "Gal", "Arag", "Elr", "Gan"]
  SUFFIXES = ["dor", "ion", "rim", "wyn", "mir", "rin", "ion", "riel", "adan", "born"]

  def generate_name
    prefix = PREFIXES.sample
    suffix = SUFFIXES.sample
    name = "#{prefix}#{suffix}"
  end
  
  def display_character_details
    puts "\nWelcome to the LOTR character generator!"
    puts "Here's your character:"
    puts "\nName: #{@character.name}"
    puts "Race: #{@character.race}"
    puts "Class: #{@character.character_class}"
    puts "Weapon: #{@character.weapon}"
  end

end
