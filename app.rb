# app.rb
require_relative "character_generator"

def run_app
  character_generator = CharacterGenerator.new
  character = character_generator.run
end

run_app if __FILE__ == $PROGRAM_NAME
