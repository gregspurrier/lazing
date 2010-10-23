unless RUBY_VERSION >= '1.9'
  raise "Lazing requires Ruby 1.9."
end

require File.expand_path('../lazing/filters', __FILE__)
require File.expand_path('../lazing/transformers', __FILE__)
