#character_generator.rb
require_relative "character"

class CharacterGenerator
  def run
    loop do 
      puts "\nWelcome to the LOTR character generator!"
      puts "Are you ready to reveal your character?"
      puts "1. Yes, I'm quite ready for an adventure!"
      puts "2. Just tea, thank you."
      option = gets.chomp.to_i
      case option
      when 1
        @character = generate_character
        display_character_details
        puts "\nGood luck on your quest!"
        break
      when 2
        puts "Come back again when you're feeling braver!"
        break
      else
        puts "Invalid Input. Try again."
        break
      end
    end
  end

  PREFIXES = ["Ara", "Eli", "Gim", "Fro", "Sam", "Leg", "Gal", "Arag", "Elr", "Gan", "Gala"]
  SUFFIXES = ["dor", "ion", "rim", "wyn", "mir", "rin", "ion", "riel", "adan", "born", "olas", "wise"]

  def generate_name
    prefix = PREFIXES.sample
    suffix = SUFFIXES.sample
    name = "#{prefix}#{suffix}"
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
  
  def display_character_details
    puts "\nHere's your character:"
    puts "\nName: #{@character.name}"
    puts "Race: #{@character.race}"
    puts "Class: #{@character.character_class}"
    puts "Weapon: #{@character.weapon}"
  end

end
