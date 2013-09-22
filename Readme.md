# Rubot

An interpreter / simulator for a toy robot control language.

# Usage

./bin/rubot [-h] [file]

If file is absent or '-', rubot reads commands from STDIN instead.

The options are as follows.

  -h: Prints this message and exits.

# Implementation

The robot control language is a valid subset of Ruby.
I first convert the script to lowercase (which is closer to idiomatic ruby), and then interpret the code from within an instance of a DSL object.

This resulted in much less code (and much simpler code) than writing a parser.
