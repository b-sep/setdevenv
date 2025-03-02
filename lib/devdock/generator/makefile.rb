# frozen_string_literal: true

module Devdock
  module Setup::Generator
    class Makefile < Base
      argument :name, type: :string

      def copy_makefile
        template('Makefile.tt', "#{name}/Makefile")
      end
    end
  end
end
