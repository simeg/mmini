#!/usr/bin/env ruby

require './cli'

class Runner
  include Cli
end

runner = Runner.new
result = runner.run(ARGV, runner.method(:post_url))
puts result
