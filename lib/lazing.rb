base_dir = File.dirname(__FILE__)
if RUBY_VERSION >= '1.9'
  require File.expand_path('lazing/filters', base_dir)
  require File.expand_path('lazing/transformers', base_dir)
  require File.expand_path('lazing/combiners', base_dir)
else
  require File.expand_path('lazing/stream', base_dir)
  require File.expand_path('enumerable', base_dir)
end
