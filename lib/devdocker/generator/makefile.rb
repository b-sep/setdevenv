# frozen_string_literal: true

module Devdocker
  module Setup::Generator
    class Makefile < Base
      argument :name, type: :string

      def copy_makefile
        template('Makefile', "#{name}/Makefile")
      end
    end
  end
end
