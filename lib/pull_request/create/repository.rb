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
    end
  end
end
