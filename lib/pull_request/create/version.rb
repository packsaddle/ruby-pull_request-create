require 'json'
module PullRequest
  module Create
    VERSION = ::JSON.parse(File.read('./lib/pull_request/create/version.json'))['version']
  end
end
