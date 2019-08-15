$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "manageiq/bishop_new/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "manageiq-bishop_new"
  s.version     = Manageiq::BishopNew::VERSION
  s.authors     = ["minhyeon"]
  s.email       = ["parkmh90@kr.ibm.com"]
  s.summary     = "Summary of Manageiq::BishopNew."
  s.description = "Description of Manageiq::BishopNew."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "pg"
end
