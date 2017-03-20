# -*- encoding: utf-8 -*-
# stub: dry_require_spec_helper 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dry_require_spec_helper".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Koichi ITO".freeze]
  s.date = "2017-03-02"
  s.description = "DRY (Don't Repeat Yourself) of require 'spec_helper'.".freeze
  s.email = "koic.ito@gmail.com".freeze
  s.executables = ["dry_require_spec_helper".freeze]
  s.files = ["bin/dry_require_spec_helper".freeze]
  s.homepage = "http://github.com/koic/dry_require_spec_helper".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.6.8".freeze
  s.summary = "DRY (Don't Repeat Yourself) of require 'spec_helper'.".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.0.0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 3.0.0"])
  end
end
