# frozen_string_literal: true

module Devdock
  module Setup::Generator
    class DockerCompose < Base
      argument :name, type: :string

      def copy_docker_compose
        template('docker-compose.yml', "#{name}/docker-compose.yml")
      end
    end
  end
end
