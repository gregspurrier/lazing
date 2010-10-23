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

## Lazy Methods
Lazing defines the following lazy filter methods:

* `finding_all`
* `rejecting`
* `selecting`

Lazing defines the following lazy transformation methods:

* `collecting`
* `mapping`

## Supported Rubies
Lazing requires Ruby 1.9.  It has been tested with:

* Ruby 1.9.1-p378
* Ruby 1.9.2-p0

## Installation
Lazing is distributed as a gem.  To install, use the command:

    gem install lazing

## Obtaining the Latest Version
Lazing is hosted on github at
[http://github.com/gregspurrier/lazing](http://github.com/gregspurrier/lazing).

A local clone of the repository can be obtained via:

    git clone git://github.com/gregspurrier/lazing.git

## Related work
After implementing [`select_first`](http://blog.rujubu.com/articles/selecting-only-what-you-need)
for a project I was working on, I searched for lazy enumeration support in Ruby.
I came across this [blog post](http://www.michaelharrison.ws/weblog/?p=163) and
it became the inspiration for Lazing.

I later discovered that my implementation of `selecting` is almost identical
to the `infinite_select` example given in Programming Ruby: The Pragmatic
Programmers' Guide by Dave Thomas.

## License
Lazing is Copyright (c) 2010 by Greg Spurrier and released under the terms of
the MIT License. Please see LICENSE.txt for details.



