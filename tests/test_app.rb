require 'minitest/autorun'
require_relative '../app'

class TestApp < Minitest::Test
  def setup
    @input = StringIO.new
    @output = StringIO.new
  end

  def teardown
    $stdin = STDIN
    $stdout = STDOUT
  end

  def test_user_input_for_no
    simulate_user_input("2")

    character_generator = CharacterGenerator.new
    character_generator.run

    @output.rewind
    output_lines = @output.string.lines

    until @input.string =~ /2/
      # wait for user input of "2"
    end

    output_lines.shift until output_lines.first =~ /Come back again when you're feeling braver!/

    assert_match(/Come back again when you're feeling braver!/, output_lines[0])
  end

  def test_user_input_for_yes
    simulate_user_input("1")

    character_generator = CharacterGenerator.new
    character_generator.run

    @output.rewind
    output_lines = @output.string.lines

    until @input.string =~ /1/
          # wait for user input of "1"
    end

    output_lines.shift until output_lines.first =~ /Here's your character:/

    assert_match(/Here's your character:/, output_lines[0])
    assert_match(/\n/, output_lines[1])
    assert_match(/Name: \w+/, output_lines[2])
    assert_match(/Race: (Human|Elf|Dwarf|Hobbit)/, output_lines[3])
    assert_match(/Class: (Warrior|Wizard|Ranger|Thief|Gardener)/, output_lines[4])
    assert_match(/Weapon: (Sword|Staff|Bow|Dagger|Rocks)/, output_lines[5])
    assert_match(/\n/, output_lines[6])
    assert_match(/Good luck on your quest!/, output_lines[7])
  end

  def simulate_user_input(input)
    @input.puts input
    @input.rewind
    $stdin = @input
    $stdout = @output
    character_generator = CharacterGenerator.new
  end
end
