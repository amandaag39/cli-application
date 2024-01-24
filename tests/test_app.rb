#tests/test_app.rb
require 'minitest/autorun'
require_relative '../app'

class TestApp < Minitest::Test
  def test_character_generator_outputs_correct_message_for_no
    input = StringIO.new("2\n")  # Simulate user entering '2'
    output = StringIO.new
  
    character_generator = CharacterGenerator.new
    character_generator.run(input, output)
  
    assert_includes output.string, "Come back again when you're feeling braver!"
  end

  def test_user_input_for_yes
    input = StringIO.new("1\n")
    output = StringIO.new

    character_generator = CharacterGenerator.new
    character_generator.run(input, output)

    output_lines = output.string.lines

    assert_match(/Here's your character:/, output_lines.join)
    assert_match(/Name: \w+/, output_lines.join)
    assert_match(/Race: (Human|Elf|Dwarf|Hobbit)/, output_lines.join)
    assert_match(/Class: (Warrior|Wizard|Ranger|Thief|Gardener)/, output_lines.join)
    assert_match(/Weapon: (Sword|Staff|Bow|Dagger|Rocks)/, output_lines.join)
    assert_match(/Good luck on your quest!/, output_lines.join)
  end
end
