#!/usr/bin/env ruby

require 'test/unit'
require 'test/unit/assertions'

require_relative './cli'

class TestRunner
  include Cli
end

class CliTest < Test::Unit::TestCase
  include Test::Unit::Assertions

  def test_is_valid_url__success
    test_runner = TestRunner.new
    url = 'http://www.valid-domain.com'

    actual = test_runner.valid_url?(url)
    expected = true

    assert_equal(expected, actual)
  end

  def test_is_valid_url__failure
    test_runner = TestRunner.new
    url = 'invalid-domain'

    actual = test_runner.valid_url?(url)
    expected = false

    assert_equal(expected, actual)
  end

  def test_run__success
    test_runner = TestRunner.new
    url = 'http://www.valid-domain.com'

    post_url_fn = proc do |_url, *_args|
      response = {}
      def response.code
        '200'
      end

      def response.body
        'some-short-id'
      end
      response
    end

    actual = test_runner.run([url], post_url_fn)
    expected = [true, 'https://mmini.herokuapp.com/some-short-id']

    assert_equal(expected, actual)
  end

  def test_run__failure
    test_runner = TestRunner.new
    url = 'http://www.valid-domain.com'

    post_url_fn = proc do |_url, *_args|
      response = {}
      def response.code
        '400'
      end

      def response.body
        'irrelevant'
      end
      response
    end

    actual = test_runner.run([url], post_url_fn)
    expected = [false, '']

    assert_equal(expected, actual)
  end
end
