# -*- encoding: utf-8 -*-
# stub: sunspot-rails-tester 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sunspot-rails-tester".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Ko".freeze]
  s.date = "2013-04-16"
  s.description = "Enable sunspot during testing for *real* integration tests".freeze
  s.email = "jko170@gmail.com".freeze
  s.homepage = "https://github.com/justinko/sunspot-rails-tester".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Stub sunspot when you want, and enable it when you want".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sunspot_rails>.freeze, [">= 1.2"])
      s.add_runtime_dependency(%q<sunspot_solr>.freeze, [">= 1.2"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<sunspot_rails>.freeze, [">= 1.2"])
      s.add_dependency(%q<sunspot_solr>.freeze, [">= 1.2"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<sunspot_rails>.freeze, [">= 1.2"])
    s.add_dependency(%q<sunspot_solr>.freeze, [">= 1.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
