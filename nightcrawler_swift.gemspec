# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nightcrawler_swift/version'

Gem::Specification.new do |spec|
  spec.name          = "nightcrawler_swift"
  spec.version       = NightcrawlerSwift::VERSION
  spec.authors       = ["tulios", "roberto"]
  spec.email         = ["ornelas.tulio@gmail.com", "roberto.tech@gmail.com"]
  spec.summary       = %q{Like X-Men nightcrawler it teleports your assets to a OpenStack Swift bucket/container}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">= 1.7.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end