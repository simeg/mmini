#!/usr/bin/env ruby

require './cli'

class Runner
  include Cli
end

runner = Runner.new
success, url = runner.run(ARGV, runner.method(:post_url))

if success
  puts url
else
  exit!
end
