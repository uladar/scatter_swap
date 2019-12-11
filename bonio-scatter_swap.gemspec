# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scatter_swap/version'

Gem::Specification.new do |spec|
  spec.name          = 'bonio-scatter_swap'
  spec.version       = ScatterSwap::VERSION
  spec.authors       = ['khiav reoy']
  spec.email         = ['mrtmrt15xn@yahoo.com.tw']

  spec.description   = %q{ScatterSwap is an integer hash function designed to have zero collisions, achieve avalanche, and be reversible.}
  spec.summary       = %q{Minimal perfect hash function for 10 digit integers}
  spec.homepage      = 'https://github.com/khiav223577/scatter_swap'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject{|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){|f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata      = {
    'homepage_uri'      => 'https://github.com/khiav223577/scatter_swap',
    'changelog_uri'     => 'https://github.com/khiav223577/scatter_swap/blob/master/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/khiav223577/scatter_swap',
    'documentation_uri' => 'https://www.rubydoc.info/gems/scatter_swap',
    'bug_tracker_uri'   => 'https://github.com/khiav223577/scatter_swap/issues',
  }
end
