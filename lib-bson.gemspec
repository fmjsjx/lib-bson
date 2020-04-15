require_relative 'lib/bson/version'

Gem::Specification.new do |spec|
  spec.name          = 'lib-bson'
  spec.version       = LibBSON::VERSION
  spec.authors       = ['Fang MinJie']
  spec.email         = ['fmjsjx@163.com']

  spec.summary       = 'Patch some useful functions for BSON in RUBY..'
  spec.description   = <<-EOF
    Lib-BSON is a simple library aims to patch some useful functions for BSON in RUBY.
  EOF
  spec.homepage      = 'https://github.com/fmjsjx/lib-bson'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'bson', '>=4.0.0', '<5.0.0'

  spec.files         = Dir['LICENSE', 'README.md', 'lib/**/*']
  spec.require_paths = ['lib']
end
