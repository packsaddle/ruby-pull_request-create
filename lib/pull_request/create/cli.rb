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
      option :debug, type: :boolean, default: false
      option :verbose, type: :boolean, default: false
      option :base, type: :string, default: Client::BASE
      option :head, type: :string
      option :title, type: :string, default: Client::TITLE
      option :body, type: :string, default: Client::BODY
      def create
        setup_logger(options)

        puts 'create!'
      rescue StandardError => e
        suggest_messages(options)
        raise e
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
      end
    end
  end
end
