require_relative 'helper'

module PullRequest
  module Create
    class TestPullRequestCreate < Test::Unit::TestCase
      test 'version' do
        assert do
          !::PullRequest::Create::VERSION.nil?
        end
      end
    end
  end
end
