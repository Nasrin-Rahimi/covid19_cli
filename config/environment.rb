  require "bundler"
# Require the gems from the Gemfile using bundler

 #require 'bundler/setup'

module Covid19
    class Error < StandardError; end
    # Your code goes here...
  end

require 'open-uri'
require 'net/http'
require 'json'
require 'pry'
require 'colorize'

require_relative "../lib/country.rb"
require_relative "../lib/cli.rb"
require_relative "../lib/api.rb"
