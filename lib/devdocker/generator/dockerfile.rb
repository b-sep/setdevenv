# frozen_string_literal: true

module Devdocker
  module Setup::Generator
    class Dockerfile < Base
      argument :path, type: :string
      argument :alpine_version, type: :string, default: nil, optional: true
      argument :ruby_version,   type: :string, default: nil, optional: true

      def copy_dockerfile
        # TODO: retrieve those values from somewhere to take latest ruby/alpine versions
        self.alpine_version ||= '3.21'
        self.ruby_version   ||= '3.4.1'

        template('Dockerfile.dev', "#{path}/Dockerfile.dev")
      end
    end
  end
end
