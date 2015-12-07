# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pull_request/create/version'

Gem::Specification.new do |spec|
  spec.name          = 'pull_request-create'
  spec.version       = PullRequest::Create::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       = 'Create pull request with few configuration.'
  spec.description   = 'Create pull request with few configuration.'
  spec.homepage      = 'https://github.com/packsaddle/ruby-pull_request-create'
  spec.license       = 'MIT'

  spec.files         = \
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
      .reject do |f|
        [
          '.travis.yml',
          'circle.yml',
          '.tachikoma.yml',
          'package.json',
        ].include?(f)
      end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'git'
  spec.add_runtime_dependency 'octokit'
  spec.add_runtime_dependency 'git_clone_url', '>= 2.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'mocha'
end
