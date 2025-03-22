# frozen_string_literal: true

require 'json'
require 'net/http'
require 'nokogiri'
require 'uri'

module SetDevEnv
  module VersionFetcher
    extend self

    ALPINE_LATEST_VERSION    = '3.21'
    RUBY_LATEST_VERSION      = '3.4.2'
    URLS = {
      alpine: 'https://alpinelinux.org/releases/',
      ruby: 'https://www.ruby-lang.org/en/downloads/releases/'
    }.freeze

    def call(resource:)
      case resource
      in :alpine then retrieve_alpine_version
      in :ruby   then retrieve_ruby_version
      end
    end

    private

    def retrieve_alpine_version
      response = make_request(:alpine)

      return ALPINE_LATEST_VERSION unless response in Net::HTTPOK

      document = Nokogiri::HTML5(response.body)

      versions = document.css('table.pure-table tbody tr td:first-child').map do |td|
        res = td.text.gsub(/\D/, '').chars

        next if res.empty?

        res[1, 0] = '.'

        res * ''
      end.uniq.compact

      find_higher_version(versions)
    rescue StandardError => _e
      ALPINE_LATEST_VERSION
    end

    def retrieve_ruby_version
      response = make_request(:ruby)

      return RUBY_LATEST_VERSION unless response in Net::HTTPOK

      document = Nokogiri::HTML5(response.body)

      versions = document.css('table.release-list tbody tr td:first-child').map do |td|
        td.text.gsub(/\D/, '')[0..2].chars * '.'
      end.uniq

      find_higher_version(versions)
    rescue StandardError => _e
      RUBY_LATEST_VERSION
    end

    def find_higher_version(versions) = versions.map { Gem::Version.new(it) }.max.to_s
    def make_request(resource)        = Net::HTTP.get_response(URI(URLS[resource]))

    private_constant :ALPINE_LATEST_VERSION, :RUBY_LATEST_VERSION, :URLS
  end
end
