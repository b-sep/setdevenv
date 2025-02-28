# frozen_string_literal: true

module Devdocker
  module Setup::Generator
    class Folder < Base
      argument :path, type: :string

      def create_folder
        empty_directory(path)
      end
    end
  end
end
