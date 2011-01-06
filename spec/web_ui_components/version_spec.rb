require 'spec_helper'

describe WebUIComponents::Version do
  it 'exists' do
    WebUIComponents::Version.should_not be_nil
  end

  it 'is a module' do
    WebUIComponents::Version.should be_a_kind_of(Module)
  end

  it 'returns the standard format for the version information it contains when to_standard_format is called' do
    WebUIComponents::Version.to_standard_format.should == [WebUIComponents::Version::MAJOR, WebUIComponents::Version::MINOR, WebUIComponents::Version::PATCH].join('.')
  end
end
