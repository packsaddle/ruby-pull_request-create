module PullRequest
  module Create
    class Client
      BASE = 'master'
      TITLE = 'Request by PullRequest::Create'
      BODY = <<-EOL.gsub(/^\s+/, '').gsub("\n", ' ')
        :hamster::hamster::hamster:
        by
        <a href="https://github.com/packsaddle/ruby-pull_request-create">PullRequest::Create</a>
      EOL

      def initialize(repo)
        @repo = repo
      end

      def create_pull_request(params)
        logger.debug(params)

        repo = decide_repo
        base = decide_base(params[:base])
        head = decide_head(params[:head])
        title = decide_title(params[:title])
        body = decide_body(params[:body])
        options = {}
        logger.debug([repo, base, head, title, body, options])
        resource = client.create_pull_request(repo, base, head, title, body, options)
        logger.debug(resource)
        resource
      end

      def decide_repo
        @repo.slug
      end

      def decide_base(base)
        base || BASE
      end

      def decide_head(head)
        head || @repo.current_branch
      end

      def decide_title(title)
        title || TITLE
      end

      def decide_body(body)
        body || BODY
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
