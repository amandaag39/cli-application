#character_generator.rb
require_relative "character"

class CharacterGenerator
  def run(input = $stdin, output = $stdout)
    loop do 
      output.puts "\nWelcome to the LOTR character generator!"
      output.puts "Are you ready to reveal your character?"
      output.puts "1. Yes, I'm quite ready for an adventure!"
      output.puts "2. Just tea, thank you."
      option = input.gets.chomp.to_i
      case option
      when 1
        @character = generate_character
        display_character_details(output)
        output.puts "\nGood luck on your quest!"
        break
      when 2
        output.puts "Come back again when you're feeling braver!"
        break
      else
        output.puts "Invalid Input. Try again."
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
  CLASSES = ["Warrior", "Wizard", "Ranger", "Thief", "Gardener"] 
  WEAPONS = ["Sword", "Staff", "Bow", "Dagger", "Rocks"]

  def generate_character
    name = generate_name
    race = RACES.sample
    character_class = CLASSES.sample
    weapon = WEAPONS.sample
    
    Character.new(name, race, character_class, weapon)
  end
  
  def display_character_details(output)
    output.puts "\nHere's your character:"
    output.puts "\nName: #{@character.name}"
    output.puts "Race: #{@character.race}"
    output.puts "Class: #{@character.character_class}"
    output.puts "Weapon: #{@character.weapon}"
  end
end
