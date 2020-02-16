# Ruby Chess

Command-line based chess game for two human players, written in Ruby.

![Chess example game](/example.gif)

## To play:

Requires: bundler v2.0+ (https://bundler.io/) and ruby v2.7.0

Clone this repo and run `bundle install`.

Then from a command line run: `ruby run.rb`.

You can navigate around the board with the arrow keys, select a piece with the Enter key, and select a place to move that piece by pressing Enter again.

NB: current implementation will cause a no-op on an illegal move.

## Todo:

- Better output for errors and prompting user input
- Implement castling and en passant moves
- Testing
