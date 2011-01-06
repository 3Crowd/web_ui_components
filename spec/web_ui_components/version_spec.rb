require 'spec_helper'

describe WebUIComponents::Version do
  it 'returns its own class name when inspect is called' do
    WebUIComponents::Version.inspect.should == WebUIComponents::Version.name
  end

  it 'returns the standard format for the version information it contains when to_s is called' do
    WebUIComponents::Version.to_s.should == [WebUIComponents::Version::MAJOR, WebUIComponents::Version::MINOR, WebUIComponents::Version::PATCH].join('.')
  end
end
