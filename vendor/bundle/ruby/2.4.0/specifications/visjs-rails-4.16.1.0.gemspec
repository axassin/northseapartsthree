# -*- encoding: utf-8 -*-
# stub: visjs-rails 4.16.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "visjs-rails".freeze
  s.version = "4.16.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Hyo Seong Choi".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-09-07"
  s.description = "Wrapping vis.js library with ruby gem for easy use in Rails projects".freeze
  s.email = ["lucius.choi@gmail.com".freeze]
  s.homepage = "https://github.com/luciuschoi/visjs-rails".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Gemify vis.js library for Rails assets pipeline".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
