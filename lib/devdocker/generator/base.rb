# frozen_string_literal: true

require 'thor/group'

module Devdocker
  module Setup::Generator
    class Base < Thor::Group
      include Thor::Actions

      def self.source_root
        "#{File.dirname(__FILE__)}/templates"
      end
    end
  end
end
