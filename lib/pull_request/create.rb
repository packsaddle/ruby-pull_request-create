require 'logger'
require 'git'
require 'octokit'

require 'pull_request/create/client'
require 'pull_request/create/repository'
require 'pull_request/create/version'

module PullRequest
  module Create
    ISSUE_URL = 'https://github.com/packsaddle/ruby-pull_request-create/issues/new'

    def self.default_logger
      logger = Logger.new(STDERR)
      logger.progname = "PullRequest::Create/#{VERSION}"
      logger.level = Logger::WARN
      logger
    end

    def self.logger
      return @logger if @logger
      @logger = default_logger
    end

    class << self
      attr_writer :logger
    end
  end
end
