
require 'bundler/setup'

module Covid19
    class Error < StandardError; end
  end

require 'open-uri'
require 'net/http'
require 'json'
require 'pry'
require 'colorize'

require_relative "../lib/country.rb"
require_relative "../lib/cli.rb"
require_relative "../lib/api.rb"
