#!/usr/bin/env ruby

require 'cgi'
require 'json'
require 'net/http'
require 'uri'

module Cli
  BACKEND_BASE = 'https://mmini.herokuapp.com'.freeze
  BACKEND = URI.parse(BACKEND_BASE + '/minify')
  HTTP = Net::HTTP.new(BACKEND.host, BACKEND.port = nil)

  def valid_url?(string)
    hits = string =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/
    !hits.nil? && hits.zero?
  end

  def post_url(url)
    header = { 'Content-Type': 'application/json' }
    body = {
      url: url
    }

    req = Net::HTTP::Post.new(BACKEND.request_uri, header)
    req.body = body.to_json

    HTTP.request(req)
  end

  def run(argv, post_url_fn)
    if argv.length != 1
      puts 'Only single argument supported'
      exit!
    end

    url = argv.first

    unless valid_url?(url)
      puts 'URL is invalid: ' + url
      exit!
    end

    response = post_url_fn.call(url)

    if response.code == '200'
      id = response.body
      success = true
      [success, BACKEND_BASE.to_s + '/' + id]
    else
      success = false
      [success, '']
    end
  end
end
