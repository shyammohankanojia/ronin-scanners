require 'spec_helper'

require 'ronin/scanners/url_scanner'

describe Scanners::URLScanner do
  let(:url) { URI('http://www.example.com/path?bla=1') }

  subject do
    described_class.object do
      def scan
        yield 'http://www.example.com/path?bla=1'
      end
    end
  end

  it "should normalize results into URI objects" do
    result = subject.first

    result.class.should == URI::HTTP
    result.scheme.should == url.scheme
    result.host.should == url.host
    result.port.should == url.port
    result.path.should == url.path
    result.query.should == url.query
  end

  it "should convert results into Url resources" do
    resource = subject.each_resource.first

    resource.class.should == URL
    resource.scheme.name.should == url.scheme
    resource.host_name.address.should == url.host
    resource.port.number.should == url.port
    resource.path.should == url.path
    resource.query_string.should == url.query
  end
end
