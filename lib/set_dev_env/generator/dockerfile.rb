# frozen_string_literal: true

require_relative '../version_fetcher'

module SetDevEnv
  module Setup::Generator
    class Dockerfile < Base
      argument :name, type: :string
      argument :alpine_version, type: :string, default: nil, optional: true
      argument :ruby_version,   type: :string, default: nil, optional: true

      def copy_dockerfile
        self.alpine_version ||= VersionFetcher.call(resource: :alpine)
        self.ruby_version   ||= VersionFetcher.call(resource: :ruby)

        template('Dockerfile.tt', "#{name}/Dockerfile.dev")
      end
    end
  end
end
