# PullRequest::Create

[![Gem Version](http://img.shields.io/gem/v/pull_request-create.svg?style=flat)](http://badge.fury.io/rb/pull_request-create)
[![Build Status](http://img.shields.io/travis/packsaddle/ruby-pull_request-create/master.svg?style=flat)](https://travis-ci.org/packsaddle/ruby-pull_request-create)

## Commands

```
Commands:
  pull-request-create create          # Create a pull request
  pull-request-create help [COMMAND]  # Describe available commands or one specific command
  pull-request-create version         # Show the PullRequest::Create version

Usage:
  pull-request-create create

Options:
  [--debug], [--no-debug]
  [--verbose], [--no-verbose]
  [--repo=REPO]
                               # Default: (YOUR_CURRENT_REPO_SLUG)
  [--base=BASE]
                               # Default: master
  [--head=HEAD]
                               # Default: (YOUR_CURRENT_BRANCH)
  [--title=TITLE]
                               # Default: Request by PullRequest::Create
  [--body=BODY]
                               # Default: :hamster::hamster::hamster: by <a href="https://github.com/packsaddle/ruby-pull_request-create">PullRequest::Create</a>

Create a pull request
```

Requires `GITHUB_ACCESS_TOKEN`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pull_request-create'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pull_request-create

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec pull_request-create` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/packsaddle/ruby-pull_request-create/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
