# frozen_string_literal: true

module Devdocker
  module Setup::Generator
    class DockerCompose < Base
      argument :path, type: :string

      def copy_docker_compose
        template('docker-compose.yml', "#{path}/docker-compose.yml")
      end
    end
  end
end
