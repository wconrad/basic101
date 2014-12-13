# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: basic101 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "basic101"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Wayne Conrad"]
  s.date = "2014-12-13"
  s.description = "[![Gem Version](https://badge.fury.io/rb/basic101.png)](http://badge.fury.io/rb/basic101) [![Dependency Status](https://gemnasium.com/wconrad/basic101.svg)](https://gemnasium.com/wconrad/basic101) [![Code Climate](https://codeclimate.com/github/wconrad/basic101.png)](https://codeclimate.com/github/wconrad/basic101) [![Build Status](https://travis-ci.org/wconrad/basic101.png)](https://travis-ci.org/wconrad/basic101)  basic101 is a circa 1980 BASIC interpreter written in Ruby.  It supports a modified subset of Microsoft's BASIC-80 v. 5 and runs the games published in Basic Computer Games, Microcomputer Edition by David H. Ahl"
  s.email = "wconrad@yagni.com"
  s.executables = ["basic101"]
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.md"
  ]
  s.files = [
    ".rspec",
    ".simplecov",
    ".travis.yml",
    ".yardopts",
    "Changelog.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.md",
    "README.md",
    "Rakefile",
    "VERSION",
    "basic101.gemspec",
    "bin/basic101",
    "lib/basic101.rb",
    "lib/basic101/abs_function.rb",
    "lib/basic101/argument_checker.rb",
    "lib/basic101/arguments.rb",
    "lib/basic101/array_reference.rb",
    "lib/basic101/asc_function.rb",
    "lib/basic101/basic_array.rb",
    "lib/basic101/basic_comparisons.rb",
    "lib/basic101/basic_float.rb",
    "lib/basic101/basic_integer.rb",
    "lib/basic101/basic_math.rb",
    "lib/basic101/basic_numeric.rb",
    "lib/basic101/basic_object.rb",
    "lib/basic101/basic_string.rb",
    "lib/basic101/binary_operation.rb",
    "lib/basic101/binary_operations.rb",
    "lib/basic101/built_in_functions.rb",
    "lib/basic101/chr_function.rb",
    "lib/basic101/cos_function.rb",
    "lib/basic101/data_statement.rb",
    "lib/basic101/define_function_statement.rb",
    "lib/basic101/dim_statement.rb",
    "lib/basic101/else_statement.rb",
    "lib/basic101/end_statement.rb",
    "lib/basic101/endif_statement.rb",
    "lib/basic101/errors.rb",
    "lib/basic101/exp_function.rb",
    "lib/basic101/for_stack.rb",
    "lib/basic101/for_statement.rb",
    "lib/basic101/function.rb",
    "lib/basic101/function_call.rb",
    "lib/basic101/function_identifier.rb",
    "lib/basic101/functions.rb",
    "lib/basic101/gosub_statement.rb",
    "lib/basic101/goto_statement.rb",
    "lib/basic101/identifier.rb",
    "lib/basic101/identity.rb",
    "lib/basic101/if_statement.rb",
    "lib/basic101/input.rb",
    "lib/basic101/input_reader.rb",
    "lib/basic101/input_statement.rb",
    "lib/basic101/int_function.rb",
    "lib/basic101/left_function.rb",
    "lib/basic101/len_function.rb",
    "lib/basic101/let_statement.rb",
    "lib/basic101/line.rb",
    "lib/basic101/log_function.rb",
    "lib/basic101/main.rb",
    "lib/basic101/mid_function.rb",
    "lib/basic101/negate_operation.rb",
    "lib/basic101/next_statement.rb",
    "lib/basic101/not_operation.rb",
    "lib/basic101/null_prompt_delimeter.rb",
    "lib/basic101/null_transcript.rb",
    "lib/basic101/numeric_identifier.rb",
    "lib/basic101/on_goto_statement.rb",
    "lib/basic101/output.rb",
    "lib/basic101/parser.rb",
    "lib/basic101/parser/data_statement.rb",
    "lib/basic101/parser/define_function_statement.rb",
    "lib/basic101/parser/dim_statement.rb",
    "lib/basic101/parser/end_statement.rb",
    "lib/basic101/parser/expression.rb",
    "lib/basic101/parser/for_statement.rb",
    "lib/basic101/parser/function_call.rb",
    "lib/basic101/parser/gosub_statement.rb",
    "lib/basic101/parser/goto_statement.rb",
    "lib/basic101/parser/identifier.rb",
    "lib/basic101/parser/if_statement.rb",
    "lib/basic101/parser/input_statement.rb",
    "lib/basic101/parser/let_statement.rb",
    "lib/basic101/parser/next_statement.rb",
    "lib/basic101/parser/numeric.rb",
    "lib/basic101/parser/on_goto_statement.rb",
    "lib/basic101/parser/print_statement.rb",
    "lib/basic101/parser/program.rb",
    "lib/basic101/parser/randomize_statement.rb",
    "lib/basic101/parser/read_statement.rb",
    "lib/basic101/parser/reference.rb",
    "lib/basic101/parser/remark_statement.rb",
    "lib/basic101/parser/restore_statement.rb",
    "lib/basic101/parser/return_statement.rb",
    "lib/basic101/parser/space.rb",
    "lib/basic101/parser/statements.rb",
    "lib/basic101/parser/stop_statement.rb",
    "lib/basic101/parser/string.rb",
    "lib/basic101/power_operation.rb",
    "lib/basic101/print_comma.rb",
    "lib/basic101/print_semicolon.rb",
    "lib/basic101/print_statement.rb",
    "lib/basic101/program.rb",
    "lib/basic101/program_counter.rb",
    "lib/basic101/prompt_delimeter.rb",
    "lib/basic101/randomize_statement.rb",
    "lib/basic101/read_statement.rb",
    "lib/basic101/reference.rb",
    "lib/basic101/remark_statement.rb",
    "lib/basic101/restore_statement.rb",
    "lib/basic101/return_statement.rb",
    "lib/basic101/right_function.rb",
    "lib/basic101/rnd_function.rb",
    "lib/basic101/runtime.rb",
    "lib/basic101/scalar_reference.rb",
    "lib/basic101/sgn_function.rb",
    "lib/basic101/sin_function.rb",
    "lib/basic101/sqr_function.rb",
    "lib/basic101/statement.rb",
    "lib/basic101/stop_statement.rb",
    "lib/basic101/str_function.rb",
    "lib/basic101/string_identifier.rb",
    "lib/basic101/tab.rb",
    "lib/basic101/tab_function.rb",
    "lib/basic101/tan_function.rb",
    "lib/basic101/transcript.rb",
    "lib/basic101/transform.rb",
    "lib/basic101/user_defined_function.rb",
    "lib/basic101/val_function.rb",
    "rake_tasks/default.rake",
    "rake_tasks/integration.rake",
    "rake_tasks/jeweler.rake",
    "rake_tasks/spec.rake",
    "rake_tasks/test.rake",
    "rake_tasks/yard.rake",
    "test/integration/arguments.rb",
    "test/integration/errors.rb",
    "test/integration/integration_test.rb",
    "test/integration/main.rb",
    "test/integration/output_file.rb",
    "test/integration/test.rb",
    "test/integration/tests/basic_computer_games/23-match.bas",
    "test/integration/tests/basic_computer_games/23-match.input",
    "test/integration/tests/basic_computer_games/23-match.output",
    "test/integration/tests/basic_computer_games/3dplot.bas",
    "test/integration/tests/basic_computer_games/3dplot.input",
    "test/integration/tests/basic_computer_games/3dplot.output",
    "test/integration/tests/basic_computer_games/aceyducy.bas",
    "test/integration/tests/basic_computer_games/aceyducy.input",
    "test/integration/tests/basic_computer_games/aceyducy.output",
    "test/integration/tests/basic_computer_games/amazing.bas",
    "test/integration/tests/basic_computer_games/amazing.input",
    "test/integration/tests/basic_computer_games/amazing.output",
    "test/integration/tests/basic_computer_games/animal.bas",
    "test/integration/tests/basic_computer_games/animal.input",
    "test/integration/tests/basic_computer_games/animal.output",
    "test/integration/tests/basic_computer_games/awari.bas",
    "test/integration/tests/basic_computer_games/awari.input",
    "test/integration/tests/basic_computer_games/awari.output",
    "test/integration/tests/basic_computer_games/bagels.bas",
    "test/integration/tests/basic_computer_games/bagels.input",
    "test/integration/tests/basic_computer_games/bagels.output",
    "test/integration/tests/basic_computer_games/banner.bas",
    "test/integration/tests/basic_computer_games/banner.input",
    "test/integration/tests/basic_computer_games/banner.output",
    "test/integration/tests/basic_computer_games/basketbl.bas",
    "test/integration/tests/basic_computer_games/basketbl.input",
    "test/integration/tests/basic_computer_games/basketbl.output",
    "test/integration/tests/basic_computer_games/batnum.bas",
    "test/integration/tests/basic_computer_games/batnum.input",
    "test/integration/tests/basic_computer_games/batnum.output",
    "test/integration/tests/basic_computer_games/battle.bas",
    "test/integration/tests/basic_computer_games/battle.input",
    "test/integration/tests/basic_computer_games/battle.output",
    "test/integration/tests/basic_computer_games/blackjck.bas",
    "test/integration/tests/basic_computer_games/blackjck.input",
    "test/integration/tests/basic_computer_games/blackjck.output",
    "test/integration/tests/basic_computer_games/bombard.bas",
    "test/integration/tests/basic_computer_games/bombard.input",
    "test/integration/tests/basic_computer_games/bombard.output",
    "test/integration/tests/basic_computer_games/bounce.bas",
    "test/integration/tests/basic_computer_games/bounce.input",
    "test/integration/tests/basic_computer_games/bounce.output",
    "test/integration/tests/basic_computer_games/bowling.bas",
    "test/integration/tests/basic_computer_games/bowling.input",
    "test/integration/tests/basic_computer_games/bowling.output",
    "test/integration/tests/basic_computer_games/boxing.bas",
    "test/integration/tests/basic_computer_games/boxing.input",
    "test/integration/tests/basic_computer_games/boxing.output",
    "test/integration/tests/basic_computer_games/bug.bas",
    "test/integration/tests/basic_computer_games/bug.input",
    "test/integration/tests/basic_computer_games/bug.output",
    "test/integration/tests/basic_computer_games/bullfght.bas",
    "test/integration/tests/basic_computer_games/bullfght.input",
    "test/integration/tests/basic_computer_games/bullfght.output",
    "test/integration/tests/basic_computer_games/bullseye.bas",
    "test/integration/tests/basic_computer_games/bullseye.input",
    "test/integration/tests/basic_computer_games/bullseye.output",
    "test/integration/tests/basic_computer_games/bunny.bas",
    "test/integration/tests/basic_computer_games/bunny.input",
    "test/integration/tests/basic_computer_games/bunny.output",
    "test/integration/tests/basic_computer_games/buzzword.bas",
    "test/integration/tests/basic_computer_games/buzzword.input",
    "test/integration/tests/basic_computer_games/buzzword.output",
    "test/integration/tests/basic_computer_games/calendar.bas",
    "test/integration/tests/basic_computer_games/calendar.input",
    "test/integration/tests/basic_computer_games/calendar.output",
    "test/integration/tests/basic_computer_games/change.bas",
    "test/integration/tests/basic_computer_games/change.input",
    "test/integration/tests/basic_computer_games/change.output",
    "test/integration/tests/basic_computer_games/checkers.bas",
    "test/integration/tests/basic_computer_games/checkers.input",
    "test/integration/tests/basic_computer_games/checkers.output",
    "test/integration/tests/basic_computer_games/chemist.bas",
    "test/integration/tests/basic_computer_games/chemist.input",
    "test/integration/tests/basic_computer_games/chemist.output",
    "test/integration/tests/basic_computer_games/chief.bas",
    "test/integration/tests/basic_computer_games/chief.input",
    "test/integration/tests/basic_computer_games/chief.output",
    "test/integration/tests/basic_computer_games/chomp.bas",
    "test/integration/tests/basic_computer_games/chomp.input",
    "test/integration/tests/basic_computer_games/chomp.output",
    "test/integration/tests/basic_computer_games/combat.bas",
    "test/integration/tests/basic_computer_games/combat.input",
    "test/integration/tests/basic_computer_games/combat.output",
    "test/integration/tests/basic_computer_games/craps.bas",
    "test/integration/tests/basic_computer_games/craps.input",
    "test/integration/tests/basic_computer_games/craps.output",
    "test/integration/tests/basic_computer_games/cube.bas",
    "test/integration/tests/basic_computer_games/cube.input",
    "test/integration/tests/basic_computer_games/cube.output",
    "test/integration/tests/basic_computer_games/depthchg.bas",
    "test/integration/tests/basic_computer_games/depthchg.input",
    "test/integration/tests/basic_computer_games/depthchg.output",
    "test/integration/tests/basic_computer_games/diamond.bas",
    "test/integration/tests/basic_computer_games/diamond.input",
    "test/integration/tests/basic_computer_games/diamond.output",
    "test/integration/tests/basic_computer_games/dice.bas",
    "test/integration/tests/basic_computer_games/dice.input",
    "test/integration/tests/basic_computer_games/dice.output",
    "test/integration/tests/basic_computer_games/digits.bas",
    "test/integration/tests/basic_computer_games/digits.input",
    "test/integration/tests/basic_computer_games/digits.output",
    "test/integration/tests/basic_computer_games/evenwin1.bas",
    "test/integration/tests/basic_computer_games/evenwin1.input",
    "test/integration/tests/basic_computer_games/evenwin1.output",
    "test/integration/tests/basic_computer_games/evenwin2.bas",
    "test/integration/tests/basic_computer_games/evenwin2.input",
    "test/integration/tests/basic_computer_games/evenwin2.output",
    "test/integration/tests/basic_computer_games/flipflop.bas",
    "test/integration/tests/basic_computer_games/flipflop.input",
    "test/integration/tests/basic_computer_games/flipflop.output",
    "test/integration/tests/basic_computer_games/footbal1.bas",
    "test/integration/tests/basic_computer_games/footbal1.input",
    "test/integration/tests/basic_computer_games/footbal1.output",
    "test/integration/tests/basic_computer_games/footbal2.bas",
    "test/integration/tests/basic_computer_games/footbal2.input",
    "test/integration/tests/basic_computer_games/footbal2.output",
    "test/integration/tests/basic_computer_games/furtradr.bas",
    "test/integration/tests/basic_computer_games/furtradr.input",
    "test/integration/tests/basic_computer_games/furtradr.output",
    "test/integration/tests/basic_computer_games/golf.bas",
    "test/integration/tests/basic_computer_games/golf.input",
    "test/integration/tests/basic_computer_games/golf.output",
    "test/integration/tests/basic_computer_games/gomoko.bas",
    "test/integration/tests/basic_computer_games/gomoko.input",
    "test/integration/tests/basic_computer_games/gomoko.output",
    "test/integration/tests/basic_computer_games/guess.bas",
    "test/integration/tests/basic_computer_games/guess.input",
    "test/integration/tests/basic_computer_games/guess.output",
    "test/integration/tests/basic_computer_games/gunner.bas",
    "test/integration/tests/basic_computer_games/gunner.input",
    "test/integration/tests/basic_computer_games/gunner.output",
    "test/integration/tests/basic_computer_games/hamurabi.bas",
    "test/integration/tests/basic_computer_games/hamurabi.input",
    "test/integration/tests/basic_computer_games/hamurabi.output",
    "test/integration/tests/basic_computer_games/hangman.bas",
    "test/integration/tests/basic_computer_games/hangman.input",
    "test/integration/tests/basic_computer_games/hangman.output",
    "test/integration/tests/basic_computer_games/hello.bas",
    "test/integration/tests/basic_computer_games/hello.input",
    "test/integration/tests/basic_computer_games/hello.output",
    "test/integration/tests/basic_computer_games/hexapawn.bas",
    "test/integration/tests/basic_computer_games/hexapawn.input",
    "test/integration/tests/basic_computer_games/hexapawn.output",
    "test/integration/tests/basic_computer_games/hi-q.bas",
    "test/integration/tests/basic_computer_games/hi-q.input",
    "test/integration/tests/basic_computer_games/hi-q.output",
    "test/integration/tests/basic_computer_games/hilo.bas",
    "test/integration/tests/basic_computer_games/hilo.input",
    "test/integration/tests/basic_computer_games/hilo.output",
    "test/integration/tests/basic_computer_games/hockey.bas",
    "test/integration/tests/basic_computer_games/hockey.input",
    "test/integration/tests/basic_computer_games/hockey.output",
    "test/integration/tests/basic_computer_games/horsrace.bas",
    "test/integration/tests/basic_computer_games/horsrace.input",
    "test/integration/tests/basic_computer_games/horsrace.output",
    "test/integration/tests/basic_computer_games/hurkle.bas",
    "test/integration/tests/basic_computer_games/hurkle.input",
    "test/integration/tests/basic_computer_games/hurkle.output",
    "test/integration/tests/basic_computer_games/kinema.bas",
    "test/integration/tests/basic_computer_games/kinema.input",
    "test/integration/tests/basic_computer_games/kinema.output",
    "test/integration/tests/basic_computer_games/king.bas",
    "test/integration/tests/basic_computer_games/king.input",
    "test/integration/tests/basic_computer_games/king.output",
    "test/integration/tests/basic_computer_games/lem.bas",
    "test/integration/tests/basic_computer_games/lem.input",
    "test/integration/tests/basic_computer_games/lem.output",
    "test/integration/tests/basic_computer_games/letter.bas",
    "test/integration/tests/basic_computer_games/letter.input",
    "test/integration/tests/basic_computer_games/letter.output",
    "test/integration/tests/basic_computer_games/life.bas",
    "test/integration/tests/basic_computer_games/life.input",
    "test/integration/tests/basic_computer_games/life.options",
    "test/integration/tests/basic_computer_games/life.output",
    "test/integration/tests/basic_computer_games/life2.bas",
    "test/integration/tests/basic_computer_games/life2.input",
    "test/integration/tests/basic_computer_games/life2.output",
    "test/integration/tests/basic_computer_games/litquiz.bas",
    "test/integration/tests/basic_computer_games/litquiz.input",
    "test/integration/tests/basic_computer_games/litquiz.output",
    "test/integration/tests/basic_computer_games/love.bas",
    "test/integration/tests/basic_computer_games/love.input",
    "test/integration/tests/basic_computer_games/love.output",
    "test/integration/tests/basic_computer_games/lunar.bas",
    "test/integration/tests/basic_computer_games/lunar.input",
    "test/integration/tests/basic_computer_games/lunar.output",
    "test/integration/tests/basic_computer_games/mastrmnd.bas",
    "test/integration/tests/basic_computer_games/mastrmnd.input",
    "test/integration/tests/basic_computer_games/mastrmnd.output",
    "test/integration/tests/basic_computer_games/mathdice.bas",
    "test/integration/tests/basic_computer_games/mathdice.input",
    "test/integration/tests/basic_computer_games/mathdice.output",
    "test/integration/tests/basic_computer_games/mugwump.bas",
    "test/integration/tests/basic_computer_games/mugwump.input",
    "test/integration/tests/basic_computer_games/mugwump.output",
    "test/integration/tests/basic_computer_games/name.bas",
    "test/integration/tests/basic_computer_games/name.input",
    "test/integration/tests/basic_computer_games/name.output",
    "test/integration/tests/basic_computer_games/nicoma.bas",
    "test/integration/tests/basic_computer_games/nicoma.input",
    "test/integration/tests/basic_computer_games/nicoma.output",
    "test/integration/tests/basic_computer_games/nim.bas",
    "test/integration/tests/basic_computer_games/nim.input",
    "test/integration/tests/basic_computer_games/nim.output",
    "test/integration/tests/basic_computer_games/number.bas",
    "test/integration/tests/basic_computer_games/number.input",
    "test/integration/tests/basic_computer_games/number.output",
    "test/integration/tests/basic_computer_games/onecheck.bas",
    "test/integration/tests/basic_computer_games/onecheck.input",
    "test/integration/tests/basic_computer_games/onecheck.output",
    "test/integration/tests/basic_computer_games/orbit.bas",
    "test/integration/tests/basic_computer_games/orbit.input",
    "test/integration/tests/basic_computer_games/orbit.output",
    "test/integration/tests/basic_computer_games/pizza.bas",
    "test/integration/tests/basic_computer_games/pizza.input",
    "test/integration/tests/basic_computer_games/pizza.output",
    "test/integration/tests/basic_computer_games/poetry.bas",
    "test/integration/tests/basic_computer_games/poetry.input",
    "test/integration/tests/basic_computer_games/poetry.options",
    "test/integration/tests/basic_computer_games/poetry.output",
    "test/integration/tests/basic_computer_games/poker.bas",
    "test/integration/tests/basic_computer_games/poker.input",
    "test/integration/tests/basic_computer_games/poker.output",
    "test/integration/tests/basic_computer_games/queen.bas",
    "test/integration/tests/basic_computer_games/queen.input",
    "test/integration/tests/basic_computer_games/queen.output",
    "test/integration/tests/basic_computer_games/reverse.bas",
    "test/integration/tests/basic_computer_games/reverse.input",
    "test/integration/tests/basic_computer_games/reverse.output",
    "test/integration/tests/basic_computer_games/rocket.bas",
    "test/integration/tests/basic_computer_games/rocket.input",
    "test/integration/tests/basic_computer_games/rocket.output",
    "test/integration/tests/basic_computer_games/rocksp.bas",
    "test/integration/tests/basic_computer_games/rocksp.input",
    "test/integration/tests/basic_computer_games/rocksp.output",
    "test/integration/tests/basic_computer_games/roulette.bas",
    "test/integration/tests/basic_computer_games/roulette.input",
    "test/integration/tests/basic_computer_games/roulette.output",
    "test/integration/tests/basic_computer_games/rusrou.bas",
    "test/integration/tests/basic_computer_games/rusrou.input",
    "test/integration/tests/basic_computer_games/rusrou.output",
    "test/integration/tests/basic_computer_games/salvo.bas",
    "test/integration/tests/basic_computer_games/salvo.input",
    "test/integration/tests/basic_computer_games/salvo.output",
    "test/integration/tests/basic_computer_games/sinewave.bas",
    "test/integration/tests/basic_computer_games/sinewave.input",
    "test/integration/tests/basic_computer_games/sinewave.output",
    "test/integration/tests/basic_computer_games/slalom.bas",
    "test/integration/tests/basic_computer_games/slalom.input",
    "test/integration/tests/basic_computer_games/slalom.output",
    "test/integration/tests/basic_computer_games/slots.bas",
    "test/integration/tests/basic_computer_games/slots.input",
    "test/integration/tests/basic_computer_games/slots.output",
    "test/integration/tests/basic_computer_games/splat.bas",
    "test/integration/tests/basic_computer_games/splat.input",
    "test/integration/tests/basic_computer_games/splat.output",
    "test/integration/tests/basic_computer_games/stars.bas",
    "test/integration/tests/basic_computer_games/stars.input",
    "test/integration/tests/basic_computer_games/stars.output",
    "test/integration/tests/basic_computer_games/stock.bas",
    "test/integration/tests/basic_computer_games/stock.input",
    "test/integration/tests/basic_computer_games/stock.output",
    "test/integration/tests/basic_computer_games/superstartrek.bas",
    "test/integration/tests/basic_computer_games/superstartrek.input",
    "test/integration/tests/basic_computer_games/superstartrek.output",
    "test/integration/tests/basic_computer_games/superstartrekins.bas",
    "test/integration/tests/basic_computer_games/superstartrekins.input",
    "test/integration/tests/basic_computer_games/superstartrekins.output",
    "test/integration/tests/basic_computer_games/synonym.bas",
    "test/integration/tests/basic_computer_games/synonym.input",
    "test/integration/tests/basic_computer_games/synonym.output",
    "test/integration/tests/basic_computer_games/target.bas",
    "test/integration/tests/basic_computer_games/target.input",
    "test/integration/tests/basic_computer_games/target.output",
    "test/integration/tests/basic_computer_games/tictac1.bas",
    "test/integration/tests/basic_computer_games/tictac1.input",
    "test/integration/tests/basic_computer_games/tictac1.output",
    "test/integration/tests/basic_computer_games/tictac2.bas",
    "test/integration/tests/basic_computer_games/tictac2.input",
    "test/integration/tests/basic_computer_games/tictac2.output",
    "test/integration/tests/basic_computer_games/towers.bas",
    "test/integration/tests/basic_computer_games/towers.input",
    "test/integration/tests/basic_computer_games/towers.output",
    "test/integration/tests/basic_computer_games/train.bas",
    "test/integration/tests/basic_computer_games/train.input",
    "test/integration/tests/basic_computer_games/train.output",
    "test/integration/tests/basic_computer_games/trap.bas",
    "test/integration/tests/basic_computer_games/trap.input",
    "test/integration/tests/basic_computer_games/trap.output",
    "test/integration/tests/basic_computer_games/war.bas",
    "test/integration/tests/basic_computer_games/war.input",
    "test/integration/tests/basic_computer_games/war.output",
    "test/integration/tests/basic_computer_games/weekday.bas",
    "test/integration/tests/basic_computer_games/weekday.input",
    "test/integration/tests/basic_computer_games/weekday.output",
    "test/integration/tests/basic_computer_games/word.bas",
    "test/integration/tests/basic_computer_games/word.input",
    "test/integration/tests/basic_computer_games/word.output",
    "test/integration/tests/fast/abs.bas",
    "test/integration/tests/fast/abs.input",
    "test/integration/tests/fast/abs.output",
    "test/integration/tests/fast/add.bas",
    "test/integration/tests/fast/add.input",
    "test/integration/tests/fast/add.output",
    "test/integration/tests/fast/and.bas",
    "test/integration/tests/fast/and.input",
    "test/integration/tests/fast/and.output",
    "test/integration/tests/fast/array.bas",
    "test/integration/tests/fast/array.input",
    "test/integration/tests/fast/array.output",
    "test/integration/tests/fast/asc.bas",
    "test/integration/tests/fast/asc.input",
    "test/integration/tests/fast/asc.output",
    "test/integration/tests/fast/chr.bas",
    "test/integration/tests/fast/chr.input",
    "test/integration/tests/fast/chr.output",
    "test/integration/tests/fast/cos.bas",
    "test/integration/tests/fast/cos.input",
    "test/integration/tests/fast/cos.output",
    "test/integration/tests/fast/def_fn.bas",
    "test/integration/tests/fast/def_fn.input",
    "test/integration/tests/fast/def_fn.output",
    "test/integration/tests/fast/divide.bas",
    "test/integration/tests/fast/divide.input",
    "test/integration/tests/fast/divide.output",
    "test/integration/tests/fast/end.bas",
    "test/integration/tests/fast/end.input",
    "test/integration/tests/fast/end.output",
    "test/integration/tests/fast/eq.bas",
    "test/integration/tests/fast/eq.input",
    "test/integration/tests/fast/eq.output",
    "test/integration/tests/fast/exp.bas",
    "test/integration/tests/fast/exp.input",
    "test/integration/tests/fast/exp.output",
    "test/integration/tests/fast/float.bas",
    "test/integration/tests/fast/float.input",
    "test/integration/tests/fast/float.output",
    "test/integration/tests/fast/for_next.bas",
    "test/integration/tests/fast/for_next.input",
    "test/integration/tests/fast/for_next.output",
    "test/integration/tests/fast/ge.bas",
    "test/integration/tests/fast/ge.input",
    "test/integration/tests/fast/ge.output",
    "test/integration/tests/fast/gosub_return.bas",
    "test/integration/tests/fast/gosub_return.input",
    "test/integration/tests/fast/gosub_return.output",
    "test/integration/tests/fast/goto.bas",
    "test/integration/tests/fast/goto.input",
    "test/integration/tests/fast/goto.output",
    "test/integration/tests/fast/gt.bas",
    "test/integration/tests/fast/gt.input",
    "test/integration/tests/fast/gt.output",
    "test/integration/tests/fast/if.bas",
    "test/integration/tests/fast/if.input",
    "test/integration/tests/fast/if.output",
    "test/integration/tests/fast/input.bas",
    "test/integration/tests/fast/input.input",
    "test/integration/tests/fast/input.output",
    "test/integration/tests/fast/int.bas",
    "test/integration/tests/fast/int.input",
    "test/integration/tests/fast/int.output",
    "test/integration/tests/fast/integer_plus_string.bas",
    "test/integration/tests/fast/integer_plus_string.input",
    "test/integration/tests/fast/integer_plus_string.output",
    "test/integration/tests/fast/invalid_argument.bas",
    "test/integration/tests/fast/invalid_argument.input",
    "test/integration/tests/fast/invalid_argument.output",
    "test/integration/tests/fast/le.bas",
    "test/integration/tests/fast/le.input",
    "test/integration/tests/fast/le.output",
    "test/integration/tests/fast/left.bas",
    "test/integration/tests/fast/left.input",
    "test/integration/tests/fast/left.output",
    "test/integration/tests/fast/len.bas",
    "test/integration/tests/fast/len.input",
    "test/integration/tests/fast/len.output",
    "test/integration/tests/fast/let.bas",
    "test/integration/tests/fast/let.input",
    "test/integration/tests/fast/let.output",
    "test/integration/tests/fast/log.bas",
    "test/integration/tests/fast/log.input",
    "test/integration/tests/fast/log.output",
    "test/integration/tests/fast/lt.bas",
    "test/integration/tests/fast/lt.input",
    "test/integration/tests/fast/lt.output",
    "test/integration/tests/fast/math.output",
    "test/integration/tests/fast/mid.bas",
    "test/integration/tests/fast/mid.input",
    "test/integration/tests/fast/mid.output",
    "test/integration/tests/fast/multiply.bas",
    "test/integration/tests/fast/multiply.input",
    "test/integration/tests/fast/multiply.output",
    "test/integration/tests/fast/ne.bas",
    "test/integration/tests/fast/ne.input",
    "test/integration/tests/fast/ne.output",
    "test/integration/tests/fast/negate.bas",
    "test/integration/tests/fast/negate.input",
    "test/integration/tests/fast/negate.output",
    "test/integration/tests/fast/not.bas",
    "test/integration/tests/fast/not.input",
    "test/integration/tests/fast/not.output",
    "test/integration/tests/fast/on_goto.bas",
    "test/integration/tests/fast/on_goto.input",
    "test/integration/tests/fast/on_goto.output",
    "test/integration/tests/fast/or.bas",
    "test/integration/tests/fast/or.input",
    "test/integration/tests/fast/or.output",
    "test/integration/tests/fast/parentheses.bas",
    "test/integration/tests/fast/parentheses.input",
    "test/integration/tests/fast/parentheses.output",
    "test/integration/tests/fast/power.bas",
    "test/integration/tests/fast/power.input",
    "test/integration/tests/fast/power.output",
    "test/integration/tests/fast/print.bas",
    "test/integration/tests/fast/print.input",
    "test/integration/tests/fast/print.output",
    "test/integration/tests/fast/read_data.bas",
    "test/integration/tests/fast/read_data.input",
    "test/integration/tests/fast/read_data.output",
    "test/integration/tests/fast/rem.bas",
    "test/integration/tests/fast/rem.input",
    "test/integration/tests/fast/rem.output",
    "test/integration/tests/fast/right.bas",
    "test/integration/tests/fast/right.input",
    "test/integration/tests/fast/right.output",
    "test/integration/tests/fast/rnd.bas",
    "test/integration/tests/fast/rnd.input",
    "test/integration/tests/fast/rnd.output",
    "test/integration/tests/fast/sgn.bas",
    "test/integration/tests/fast/sgn.input",
    "test/integration/tests/fast/sgn.output",
    "test/integration/tests/fast/sin.bas",
    "test/integration/tests/fast/sin.input",
    "test/integration/tests/fast/sin.output",
    "test/integration/tests/fast/sqr.bas",
    "test/integration/tests/fast/sqr.input",
    "test/integration/tests/fast/sqr.output",
    "test/integration/tests/fast/stop.bas",
    "test/integration/tests/fast/stop.input",
    "test/integration/tests/fast/stop.output",
    "test/integration/tests/fast/str.bas",
    "test/integration/tests/fast/str.input",
    "test/integration/tests/fast/str.output",
    "test/integration/tests/fast/string_addition.bas",
    "test/integration/tests/fast/string_addition.input",
    "test/integration/tests/fast/string_addition.output",
    "test/integration/tests/fast/string_comparisons.bas",
    "test/integration/tests/fast/string_comparisons.input",
    "test/integration/tests/fast/string_comparisons.output",
    "test/integration/tests/fast/string_plus_integer.bas",
    "test/integration/tests/fast/string_plus_integer.input",
    "test/integration/tests/fast/string_plus_integer.output",
    "test/integration/tests/fast/subtract.bas",
    "test/integration/tests/fast/subtract.input",
    "test/integration/tests/fast/subtract.output",
    "test/integration/tests/fast/tab.bas",
    "test/integration/tests/fast/tab.input",
    "test/integration/tests/fast/tab.output",
    "test/integration/tests/fast/tan.bas",
    "test/integration/tests/fast/tan.input",
    "test/integration/tests/fast/tan.output",
    "test/integration/tests/fast/val.bas",
    "test/integration/tests/fast/val.input",
    "test/integration/tests/fast/val.output",
    "test/spec/argument_checker_spec.rb",
    "test/spec/basic_array_spec.rb",
    "test/spec/basic_float_spec.rb",
    "test/spec/basic_integer_spec.rb",
    "test/spec/basic_numeric_spec.rb",
    "test/spec/basic_object_spec.rb",
    "test/spec/basic_string_spec.rb",
    "test/spec/for_stack_spec.rb",
    "test/spec/input_reader_spec.rb",
    "test/spec/input_spec.rb",
    "test/spec/line_spec.rb",
    "test/spec/output_spec.rb",
    "test/spec/parser_spec.rb",
    "test/spec/program_spec.rb",
    "test/spec/spec_helper.rb",
    "test/spec/support/basic_numeric_helpers.rb",
    "test/spec/support/basic_object_helpers.rb",
    "test/spec/transcript_spec.rb",
    "test/spec/transform_spec.rb"
  ]
  s.homepage = "http://github.com/wconrad/basic101"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.4"
  s.summary = "Circa 1980 basic intepreter"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parslet>, ["~> 1.5"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.4"])
      s.add_development_dependency(%q<redcarpet>, ["~> 3.2"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
      s.add_development_dependency(%q<rspec-its>, ["~> 1.1"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.9"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7"])
    else
      s.add_dependency(%q<parslet>, ["~> 1.5"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<rake>, ["~> 10.4"])
      s.add_dependency(%q<redcarpet>, ["~> 3.2"])
      s.add_dependency(%q<rspec>, ["~> 3.1"])
      s.add_dependency(%q<rspec-its>, ["~> 1.1"])
      s.add_dependency(%q<simplecov>, ["~> 0.9"])
      s.add_dependency(%q<yard>, ["~> 0.8.7"])
    end
  else
    s.add_dependency(%q<parslet>, ["~> 1.5"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<rake>, ["~> 10.4"])
    s.add_dependency(%q<redcarpet>, ["~> 3.2"])
    s.add_dependency(%q<rspec>, ["~> 3.1"])
    s.add_dependency(%q<rspec-its>, ["~> 1.1"])
    s.add_dependency(%q<simplecov>, ["~> 0.9"])
    s.add_dependency(%q<yard>, ["~> 0.8.7"])
  end
end

