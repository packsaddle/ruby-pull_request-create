module PullRequest
  module Create
    class Client
      BASE = 'master'
      TITLE = 'Request by PullRequest::Create'
      BODY = ':hamster::hamster::hamster:'

      def initialize(repo)
        @repo = repo
      end

      def create_pull_request(_params)
        client.create_pull_request(repo, base, head, title, body = nil, options = {})
      end

      def logger
        ::PullRequest::Create.logger
      end

      def client
        @client ||= ::Octokit::Client.new(access_token: access_token)
      end

      def access_token
        ENV['GITHUB_ACCESS_TOKEN']
      end
    end
  end
end
