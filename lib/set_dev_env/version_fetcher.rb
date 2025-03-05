# frozen_string_literal: true

require 'json'
require 'net/http'
require 'nokogiri'
require 'uri'

module SetDevEnv
  module VersionFetcher
    CACHE_FOLDER_PATH      = "#{File.dirname(__FILE__, 3)}/.cache".freeze
    RUBY_LATEST_VERSION    = '3.4.2'
    RUBY_RELEASES_ENDPOINT = 'https://www.ruby-lang.org/en/downloads/releases/'

    class << self
      def call(resource:)
        case resource
        in :alpine then alpine
        in :ruby   then ruby(resource:)
        end
      end

      private

      def alpine = '3.21'

      def ruby(resource:)
        retrieve_version_from_cache(resource) || retrieve_version_from_web
      end

      def retrieve_version_from_cache(resource)
        cache_file_path = "#{CACHE_FOLDER_PATH}/cache.json"

        return unless File.readable?(cache_file_path)

        cache = JSON.parse(File.read(cache_file_path), symbolize_names: true)

        cache[resource]&.fetch(:latest_version)
      end

      def retrieve_version_from_web
        response = Net::HTTP.get_response(URI(RUBY_RELEASES_ENDPOINT))

        return RUBY_LATEST_VERSION unless response.instance_of?(Net::HTTPOK)

        document = Nokogiri::HTML5(response.body)

        versions = document.css('table.release-list tr td:first-child').map do |td|
          td.text.gsub(/\D/, '')[0..2].chars * '.'
        end.uniq

        higher_version = find_higher_version(versions)
        cache(higher_version)

        higher_version
      rescue StandardError => _e
        RUBY_LATEST_VERSION
      end

      def find_higher_version(versions)
        versions.map { Gem::Version.new(it) }.max.to_s
      end

      def cache(version)
        FileUtils.mkdir_p(CACHE_FOLDER_PATH)

        # TODO: prevent overwrite file if file exists (in case im caching alpine/ruby versions
        File.write(
          '../../.cache/cache.json',
          JSON.pretty_generate({ ruby: { latest_version: version } })
        )
      end
    end

    private_constant :CACHE_FOLDER_PATH, :RUBY_LATEST_VERSION, :RUBY_RELEASES_ENDPOINT
  end
end
