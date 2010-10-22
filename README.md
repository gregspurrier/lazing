# Lazing
Lazing provides lazy equivalents for many of the methods in Ruby's standard
`Enumerable` module.  The lazy variants all end in 'ing', hence the name.

For example:

    >> (1..20).selecting {|x| raise 'boom' if x == 6; x.odd?}.first(3)
     => [1, 3, 5]

Compare the above with the behavior of the non-lazy standard version:

    >> (1..20).select {|x| raise 'boom' if x == 6; x.odd?}.first(3)
    RuntimeError: boom
      from (irb):4:in `block in irb_binding'
      from (irb):4:in `each'
      from (irb):4:in `select'
      from (irb):4
      from irb:17:in `<main>'

## Installation

## Obtaining the Latest Version
Lazing is hosted on github at

## License
Lazing is Copyright (c) 2010 by Greg Spurrier and released under the terms of
the MIT License. Please see LICENSE.txt for details.



