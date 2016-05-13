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


  spec.files         = ["lib/pitchfork_reviews.rb", "lib/pitchfork_reviews/album.rb", "lib/pitchfork_reviews/cli.rb", "lib/pitchfork_reviews/version.rb"]
  spec.bindir        = "bin"
  spec.executables   << 'pitchfork-reviews'
  spec.require_paths = ["lib", "lib/pitchfork_reviews"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
