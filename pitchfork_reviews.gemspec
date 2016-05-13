# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pitchfork_reviews/version'

Gem::Specification.new do |spec|
  spec.name          = "pitchfork_reviews"
  spec.version       = PitchforkReviews::VERSION
  spec.authors       = ["depippo"]
  spec.email         = ["jdepippo@gmail.com"]

  spec.summary       = %q{Pitchfork reviews}
  spec.description   = %q{Pitchfork reviews}
  spec.homepage      = "https://github.com/depippo/pitchfork_reviews"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
