$:.unshift(File.join(File.dirname(__FILE__),'lib')) unless $:.member?(File.join(File.dirname(__FILE__),'lib'))
require 'web_ui_components/version'

Gem::Specification.new do |s|
  s.name	= 'web_ui_components'
  s.version	= WebUIComponents::Version.to_s
  s.authors	= ["Justin Lynn (justinlynn)", "3Crowd Technologies, Inc. (Sponsor)"]
  s.email	= ["ops@3crowd.com"]
  s.homepage	= "http://github.com/3Crowd/ui_components"
  s.summary	= "A common set of UI components geared for the web"
  s.description = "A common set of UI Components geared for the web. Provides consistent, semantic HTML User Interface components designed to work with major complementary web technologies (CSS and JavaScript, primariliy)."

  s.required_rubygems_version = ">= 1.3.7"

  s.files	= Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.executables = Dir.glob("{bin}/*")
  s.require_path= 'lib'

  s.add_runtime_dependency "activesupport", "~> 3.0.3"

end
