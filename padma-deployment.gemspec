# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Dwayne Macgowan"]
  gem.email         = ["dwaynemac@gmail.com"]
  gem.description   = %q{Deployment rake tasks}
  gem.summary       = %q{Deployment rake tasks}
  gem.homepage      = ""

	gem.files = Dir["{app,lib,vendor}/**/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "padma-deployment"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
  gem.add_dependency "railties", ">= 3.1"
end
