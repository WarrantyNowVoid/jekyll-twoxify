# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-twoxify/version"
Gem::Specification.new do |spec|
  spec.name          = "jekyll-twoxify"
  spec.summary       = "Generate the src and srcset img tag attributes for an image"
  spec.description   = "Jekyll plugin to generate src attribute for an img tag with the given image, and also the srcset with an appropriate @2x path for the image if one exists on the filesystem."
  spec.version       = Jekyll::TwoXify::VERSION
  spec.authors       = ["Nick Pettazzoni"]
  spec.email         = ["pettazz@gmail.com"]
  spec.homepage      = "https://github.com/warrantynowvoid/jekyll-twoxify"
  spec.licenses      = ["Nonstandard"]
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!) }
  spec.require_paths = ["lib"]
  spec.add_dependency "jekyll", "~> 3.0"
end