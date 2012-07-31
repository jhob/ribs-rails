# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "ribs-rails"
  s.version = "0.0.1"
  s.authors     = ["Joey Hobbs"]
  s.email       = ["joey@quid.com"]
  s.homepage    = "http://github.com/quid/ribs-rails"
  
  s.summary = "Use ribs.coffee with rails 3.2"
  s.description = "Quickly setup ribs.coffee for use with rails 3.2."
  s.files = Dir["vendor/**/*"] + ["LICENSE", "README.md"]
  
  s.add_dependency('coffee-script', '~> 2.2.0')
  
  s.require_paths = ['lib']
end
