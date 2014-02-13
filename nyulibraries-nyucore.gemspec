# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nyulibraries/nyucore/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name     = 'nyulibraries-nyucore'
  gem.version  = Nyulibraries::NyuCore::VERSION
  gem.authors  = ['Corey Harper']
  gem.email    = ['corey.harper@nyu.edu']
  gem.summary  = 'Ruby library for working with NYUCore'
  gem.homepage = 'https://github.com/NYULibraries/nyulibraries-nyucore'
  gem.license  = 'MIT'

  gem.description = %w{ Ruby library for working with NYUCore, the metadata vocabulary
                        for interoperability across NYU Digital Collections }


  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'multi_xml', '~> 0.5.5'

  gem.add_development_dependency 'rake', '~> 10.1.0'
  gem.add_development_dependency 'rspec', '~> 2.14.0'
end
