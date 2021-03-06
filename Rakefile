require 'rspec/core/rake_task'
require 'metric_fu'

MetricFu::Configuration.run do |config|
config.rcov = { :environment => 'test',
                :test_files => ['spec/**/*_spec.rb'],
                :rcov_opts => ["--sort coverage", 
                               "--no-html", 
                               "--text-coverage",
                               "--no-color",
                               "--profile",
                               "-I lib:spec",
                               "--exclude /gems/,/Library/,/usr/,spec"],
                :external => nil
                }
end

RSpec::Core::RakeTask.new :spec

desc 'Run RSpec in Documentation printing mode, verbosely enumerate all specifications'
RSpec::Core::RakeTask.new :specdoc do |s|
  s.rspec_opts	= ['--format documentation',
                   '--color'
                  ]
end

require 'bundler'

Bundler::GemHelper.install_tasks

require 'yard'

namespace :doc do

  YARD::Rake::YardocTask.new(:public) do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['-odoc']
  end

  YARD::Rake::YardocTask.new(:private) do |t|
    t.files  = ['lib/**/*.rb']
    t.options= ['--private',
                '-oprivate_api_doc'
               ]
  end

end

task :default => [ :spec, 'doc:public', 'doc:private' ]
