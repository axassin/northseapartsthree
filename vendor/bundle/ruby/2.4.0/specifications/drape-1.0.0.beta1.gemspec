# -*- encoding: utf-8 -*-
# stub: drape 1.0.0.beta1 ruby lib

Gem::Specification.new do |s|
  s.name = "drape".freeze
  s.version = "1.0.0.beta1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrew Emelianenko".freeze, "Jeff Casimir".freeze, "Steve Klabnik".freeze]
  s.date = "2016-05-29"
  s.description = "Drape adds an object-oriented layer of presentation logic to your Rails apps.".freeze
  s.email = ["andrew@soften-it.com".freeze, "jeff@casimircreative.com".freeze, "steve@steveklabnik.com".freeze]
  s.homepage = "http://github.com/MrEmelianenko/drape".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "View Models for Rails".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.0.0.beta1"])
      s.add_runtime_dependency(%q<actionpack>.freeze, [">= 5.0.0.beta1"])
      s.add_runtime_dependency(%q<request_store>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<activemodel>.freeze, [">= 5.0.0.beta1"])
      s.add_runtime_dependency(%q<activemodel-serializers-xml>.freeze, [">= 1.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 3.5.0.beta1"])
      s.add_development_dependency(%q<minitest-rails>.freeze, [">= 2.2.0"])
      s.add_development_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_development_dependency(%q<active_model_serializers>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 5.0.0.beta1"])
      s.add_dependency(%q<actionpack>.freeze, [">= 5.0.0.beta1"])
      s.add_dependency(%q<request_store>.freeze, ["~> 1.0"])
      s.add_dependency(%q<activemodel>.freeze, [">= 5.0.0.beta1"])
      s.add_dependency(%q<activemodel-serializers-xml>.freeze, [">= 1.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 3.5.0.beta1"])
      s.add_dependency(%q<minitest-rails>.freeze, [">= 2.2.0"])
      s.add_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_dependency(%q<active_model_serializers>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5.0.0.beta1"])
    s.add_dependency(%q<actionpack>.freeze, [">= 5.0.0.beta1"])
    s.add_dependency(%q<request_store>.freeze, ["~> 1.0"])
    s.add_dependency(%q<activemodel>.freeze, [">= 5.0.0.beta1"])
    s.add_dependency(%q<activemodel-serializers-xml>.freeze, [">= 1.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 3.5.0.beta1"])
    s.add_dependency(%q<minitest-rails>.freeze, [">= 2.2.0"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<active_model_serializers>.freeze, [">= 0"])
  end
end
