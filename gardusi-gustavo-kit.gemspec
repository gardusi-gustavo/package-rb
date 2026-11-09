Gem::Specification.new do |spec|
  spec.name = "gardusi-gustavo-kit"
  spec.version = "0.1.0"
  spec.summary = "Gardusi Gustavo Ruby kit"
  spec.authors = ["Gardusi Gustavo"]
  spec.files = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 3.1"
  spec.add_development_dependency "minitest", ">= 5.20"
  spec.add_development_dependency "rake", ">= 13.0"
end
