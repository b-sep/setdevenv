# frozen_string_literal: true

require 'test_helper'

class TestDevdocker < Minitest::Test
  def setup
    @name = 'example'
    @original_stdout = $stdout

    $stdout = StringIO.new
  end

  def teardown
    FileUtils.rm_rf([@name])
  ensure
    $stdout = @original_stdout
  end

  def test_that_it_has_a_version_number
    refute_nil ::Devdocker::VERSION
  end

  def test_create_project
    Devdocker.create(@name)

    assert(Dir.exist?(@name))
    assert_includes(Dir.entries(@name), 'Dockerfile.dev')
    assert_includes(Dir.entries(@name), 'docker-compose.yml')
  end
end
