require 'thor'

module PullRequest
  module Create
    class CLI < Thor
      def self.exit_on_failure?
        true
      end

      desc 'version', 'Show the PullRequest::Create version'
      map %w(-v --version) => :version

      def version
        puts "PullRequest::Create version #{::PullRequest::Create::VERSION}"
      end

      desc 'create', 'Create a pull request'
      def create
        puts 'create!'
      end
      default_command :create

      no_commands do
        def logger
          ::PullRequest::Create.logger
        end

        def setup_logger(options)
          if options[:debug]
            logger.level = Logger::DEBUG
          elsif options[:verbose]
            logger.level = Logger::INFO
          end
          logger.debug(options)
        end

        def suggest_messages(options)
          logger.error 'Have a question? Please ask us:'
          logger.error ISSUE_URL
          logger.error 'options:'
          logger.error options
        end

        # http://stackoverflow.com/a/23955971/104080
        def method_missing(method, *args)
          self.class.start([self.class.default_command, method.to_s] + args)
        end
      end
    end
  end
end
