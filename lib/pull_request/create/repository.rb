module PullRequest
  module Create
    class Repository
      def initialize(path, options = {})
        @path = path
        @options = options
      end

      def logger
        ::PullRequest::Create.logger
      end

      def git
        @git ||= ::Git.open(@path, @options)
      end

      def current_branch
        git.current_branch
      end

      def slug
        slug_regex = %r{\A/(?<slug>.*?)(?:\.git)?\Z}
        remote_urls.map do |url|
          uri = GitCloneUrl.parse(url)
          match = slug_regex.match(uri.path)
          match[:slug] if match
        end.compact.first
      end

      def remote_urls
        git
          .remotes
          .map(&:url)
      end
    end
  end
end
