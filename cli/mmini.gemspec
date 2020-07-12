Gem::Specification.new do |spec|
  spec.name = "mmini"
  spec.version = "1.0.0"
  spec.authors = ["Simon Egersand"]

  spec.summary = "CLI client for minifier server"
  spec.homepage = "https://github.com/simeg/minifier"
  spec.license = "MIT"

  spec.files = %w[lib/lib_mmini.rb]
  spec.require_paths = ["lib"]
  spec.executables << "mmini"

  spec.required_ruby_version = '>= 2.0.0'
end