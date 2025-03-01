# frozen_string_literal: true

module Devdocker
  module Setup::Generator
    class Folder < Base
      argument :name, type: :string

      def create_folder
        empty_directory(name)
      end
    end
  end
end
