# -*- encoding: utf-8 -*-
# stub: validates_overlap 0.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "validates_overlap".freeze
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robin Bortlik".freeze]
  s.date = "2013-10-18"
  s.description = "It can be useful when you you are developing some app where you will work with meetings, events etc.".freeze
  s.email = "robinbortlik@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/robinbortlik/validates_overlap".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "This gem helps validate records with time overlap.".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 2.12"])
      s.add_development_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.12"])
      s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.2"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.12"])
    s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.2"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
