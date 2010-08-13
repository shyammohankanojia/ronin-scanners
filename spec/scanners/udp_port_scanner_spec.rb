require 'spec_helper'
require 'helpers/database'

require 'ronin/scanners/udp_port_scanner'

describe Scanners::UDPPortScanner do
  let(:port) { 135 }

  subject do
    ronin_udp_port_scanner do
      def scan
        yield '135'
      end
    end
  end

  it "should normalize results into Integers" do
    subject.first.should == port
  end

  it "should convert results into OpenPort resources" do
    resource = subject.each_resource.first

    resource.class.should == OpenPort
    resource.port.protocol.should == 'udp'
    resource.port.number.should == port
  end
end
