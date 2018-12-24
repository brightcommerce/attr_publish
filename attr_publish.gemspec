require "./lib/attr_publish/version"

Gem::Specification.new do |gem|
  gem.name        = "attr_publish"
  gem.version     = AttrPublish::Version::Compact
  gem.summary     = AttrPublish::Version::Summary
  gem.description = AttrPublish::Version::Description
  gem.authors     = AttrPublish::Version::Author
  gem.email       = AttrPublish::Version::Email
  gem.homepage    = AttrPublish::Version::Homepage
  gem.license     = AttrPublish::Version::License
  gem.metadata    = AttrPublish::Version::Metadata
  gem.platform    = Gem::Platform::RUBY

  gem.required_ruby_version = '>= 2.3'
  gem.require_paths = ["lib"]
  gem.files = Dir[
    "{lib}/**/*",
    "MIT-LICENSE",
    "CHANGELOG.md",
    "README.md"
  ]

  gem.add_runtime_dependency 'activerecord', '>= 5.1.4'
  gem.add_runtime_dependency 'activesupport', '>= 5.1.4'
end
