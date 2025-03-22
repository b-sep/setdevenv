# frozen_string_literal: true

require 'test_helper'

class TestVersionFetcher < Minitest::Test
  def test_call_with_alpine_as_resource
    html = <<~HTML
      <table class="pure-table">
        <tbody>
          <tr>
            <td>
              <a href="https://dl-cdn.alpinelinux.org/alpine/edge/">edge</a>
            </td>
          </tr>
          <tr>
            <td>
              <a href="https://dl-cdn.alpinelinux.org/alpine/v3.21/">v3.21</a>
            </td>
          </tr>
          <tr>
            <td>
              <a href="https://dl-cdn.alpinelinux.org/alpine/v3.20/">v3.20</a>
            </td>
          </tr>
        </tbody>
      </table>
    HTML

    stub_request(:get, 'https://alpinelinux.org/releases/')
      .to_return(status: 200, body: html)

    assert_equal('3.21', SetDevEnv::VersionFetcher.call(resource: :alpine))
  end

  def test_call_with_alpine_as_resource_error
    # TODO: test that returns the latest version if error is raised
  end

  def test_call_with_ruby_as_resource
    html = <<~HTML
      <table class="release-list">
        <tbody>
          <tr>
            <td>Ruby 3.4.2</td>
          </tr>
          <tr>
            <td>Ruby 3.2.7</td>
          </tr>
          <tr>
            <td>Ruby 3.3.7</td>
          </tr>
        </tbody>
      </table>
    HTML

    stub_request(:get, 'https://www.ruby-lang.org/en/downloads/releases/')
      .to_return(status: 200, body: html)

    assert_equal('3.4.2', SetDevEnv::VersionFetcher.call(resource: :ruby))
  end
end
