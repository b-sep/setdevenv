# frozen_string_literal: true

require 'test_helper'

class TestDevdock < Minitest::Test
  def setup
    @name = 'example'
  end

  def teardown
    FileUtils.rm_rf([@name])
  end

  def test_that_it_has_a_version_number
    refute_nil ::Devdock::VERSION
  end

  def test_create_project
    assert_output(
      "      create  example\n      create  example/Dockerfile.dev\n      create  example/docker-compose.yml\n" \
      "      create  example/Makefile\n"
    ) do
      Devdock.create(@name)
    end

    assert(Dir.exist?(@name))
    assert_includes(Dir.entries(@name), 'Dockerfile.dev')
    assert_includes(Dir.entries(@name), 'docker-compose.yml')
    assert_includes(Dir.entries(@name), 'Makefile')
  end
end
