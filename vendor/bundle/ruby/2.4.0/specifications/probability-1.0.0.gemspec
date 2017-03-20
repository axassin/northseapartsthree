# -*- encoding: utf-8 -*-
# stub: probability 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "probability".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ariejan de Vroom".freeze]
  s.date = "2012-06-14"
  s.description = "A simple extension to ruby to use probability in your apps. Great for games and stuff.".freeze
  s.email = ["ariejan@ariejan.net".freeze]
  s.homepage = "https://github.com/ariejan/probability".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Add probability to your app.".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.10.0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 2.10.0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 2.10.0"])
  end
end
