# frozen_string_literal: true

require_relative 'devdocker/setup'
require_relative 'devdocker/version'

module Devdocker
  def self.create(path)
    Setup.new(path).build
  end
end
