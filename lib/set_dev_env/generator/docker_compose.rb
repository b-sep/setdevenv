# frozen_string_literal: true

module SetDevEnv
  module Setup::Generator
    class DockerCompose < Base
      argument :name, type: :string

      def copy_docker_compose
        template('docker-compose.tt', "#{name}/docker-compose.yml")
      end
    end
  end
end
