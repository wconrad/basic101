# Basic101 [![Code Climate](https://codeclimate.com/github/wconrad/basic101.png)](https://codeclimate.com/github/wconrad/basic101) [![Build Status](https://travis-ci.org/wconrad/basic101.png)](https://travis-ci.org/wconrad/basic101)

basic101 is a circa 1980 BASIC interpreter written in Ruby.  It
supports a modified subset of Microsoft's BASIC-80 v. 5 and runs
the games published in Basic Computer Games, Microcomputer
Edition by David H. Ahl

## Why?

Compilers and interpreters are great fun.  I wanted to experiment with
a modern parser, but needed a target language.  The target language of
"something that properly runs the programs in [_Basic Computer Games,
Microcomputer Edition_][2] is perfect because:

* BASIC is a relatively simple language.

* The book's programs are all for the same dialect of BASIC.

* The book's programs are available in electronic form.

* The book contains short transcripts of each program running.

### Which parser?

This interpreter uses [Parslet][12], a Ruby library for [Parsing
Expression Grammars][11] (PEG).  Parslet has several attractive
properties:

* Parse and transform rules are expressed in an internal DSL.  This
  makes possible the dynamic generation of parse and transform rules.

* It has an [elegant mechanism][14] for transforming the [parse
  tree][15] into an [abstract syntax tree][13].

## Installation

    gem install basic101

## How to use

First, download a BASIC program such as one of those from [Classic
Basic Games][9] or [Vintage BASIC's archive][8].  Then simply run the
interpreter with the path of the program:

    basic101 superstartrek.bas

Most of these programs are included with this gem, in the directory:

    test/integration/test/basic_computer_games

A few of these programs have had minor changes to work with basic101.
This is not unusual in the world of BASIC.  Because Microcomputer
BASICs were not written to any single specification, they all vary in
small details.  It was usual, in the day, to have to change a BASIC
program to get it to run on the interpreter you were using.

## License

The basic101 interpreter is released under the [MIT
License](LICENSE.md).

The BASIC programs which originally appeared in [_Basic Computer
Games, Microcomputer Edition_][2] are _not_ under the MIT license.
They are included with the kind permission of David H. Ahl.  David
makes these programs "available to people who want to reprint them,
convert them to other languages or forms of Basic, or analyze the
code."

## Ruby Compatability

basic101 requires Ruby 2.0 or greater.

## OS Compatability

basic101 was developed in Linux.  While it does not knowingly use any
Unix-only features, it has not been tested under Windows.  I would be
grateful for any reports of success or failure running basic101 under
Windows (or any other operating system).

## Development

### Tests

To run all tests:

    rake test

or just:

    rake

To run the rspec (unit) tests:

    rake test:spec

To run the integration tests:

    rake test:integration

The integration tests are driven by
`tests/integration/integration_test.rb`.  During development, you
often want to run just one test, not all of them; to do so, bypass the
rake task and run `integration_test.rb` directly.

To run only the _print_ test:

    integration_test.rb print

To run only the fast tests:

    integration_test.rb fast

If you change how the interpreter behaves, the tests will notice.  If
you want the new behavior to become the expected behavior, then
_train_ the test or tests that are affected.  _Training_ causes the
current behavior to become the expected behavior in the future.  To
train the _print_ test:

    integration_test.rb -t print

To train all tests:

    integration_test.rb -t

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## References

* [Basic Computer Games, Microcomputer Edition][2]
* [Basic-80 Reference Manual, v. 5][1]
* [Vintage BASIC][3] and its [source][10]
* [Classic Basic Games][9]

## Credits

### David H. Ahl

This program was inspired by [_Basic Computer Games, Microcomputer
Edition_][2] by David H. Ahl.  David, Thank you for inspiring us to
tinker, learn, and have fun with these wonderful machines.

### Lyle Kopnicky

Lyle Kopnicky wrote [Vintage BASIC][3], an open source BASIC written
in Haskell.  Vintage BASIC is a valuable resource for any
vintage-BASIC author, even if you don't know Haskell.  It is a good
reference model when you are wondering how some ambiguous part of the
language behaves.  Be sure to check out [the interpreter test][4] for
examples in the form of "this program produces that output".  You
don't have to know Haskell to understand them.

[Vintage BASIC's archive][8] of programs for "Basic Computer Games" is
similar to that of [Classic Basic Games][9], except that Lyle's
archive has two additional programs:

* [Civil War][7]
* [Super Star Trek][5] and [its instructions][6]

That's a lot of typing.  Thank you, Lyle.

### Classic Basic Games

Most of the programs from "Basic Computer Games" are available at
[Classic Basic Games][9], a wonderful resource for aspiring
interpreter writers.

## Whoami

Wayne Conrad <wconrad@yagni.com>

[1]: https://archive.org/details/BASIC-80_MBASIC_Reference_Manual
[2]: http://www.atariarchives.org/basicgames/index.php
[3]: http://www.vintage-basic.net/index.html
[4]: https://github.com/lylek/vintage-basic/blob/master/test/Language/VintageBasic/Interpreter_test.hs
[5]: http://www.vintage-basic.net/bcg/superstartrek.bas
[6]: http://www.vintage-basic.net/bcg/superstartrekins.bas
[7]: http://www.vintage-basic.net/bcg/civilwar.bas
[8]: http://www.vintage-basic.net/games.html
[9]: http://www.classicbasicgames.org/
[10]: https://github.com/lylek/vintage-basic
[11]: http://en.wikipedia.org/wiki/Parsing_expression_grammar
[12]: http://kschiess.github.io/parslet/
[13]: http://en.wikipedia.org/wiki/Abstract_syntax_tree
[14]: http://kschiess.github.io/parslet/transform.html
[15]: http://en.wikipedia.org/wiki/Parse_tree
