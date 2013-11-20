# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "maillift/version"

Gem::Specification.new do |s|
  s.name									= "maillift"
  s.version								= MailLift::VERSION
  s.platform							= Gem::Platform::RUBY
  s.author								= "Kyle Wilkinson"
  s.email									= "kai@wikyd.org"
  s.homepage							= "https://github.com/wikyd"
  s.summary								= "A simple library to talk to the MailLift API."
  s.description						= "A simple library to talk to the MailLift API."
	s.license								= "MIT"

	s.required_ruby_version = "~> 2.0.0"

  s.add_dependency('rest-client', '~> 1.6')

  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-debugger"
  s.add_development_dependency "pry-rescue"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-vterm_aliases"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rb-fsevent" # Guard file events for OSX.
  s.add_development_dependency "rb-inotify" # Guard file events for Linux.
  s.add_development_dependency "guard-rspec"

  s.files            = Dir["lib/**/*", "vendor/**/*"]
  s.extra_rdoc_files = Dir["README*", "LICENSE*"]
  s.require_paths    = ["lib"]
end
