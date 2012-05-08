require 'tor_proxy'

describe Tor::Proxy do
  describe '.new' do
    context 'without tor' do
      before do
        Tor.stub(:available?).and_return(false)
      end

      it "should raise if Tor isn't installed" do
        lambda {
          Tor::Proxy.new
        }.should raise_error(RuntimeError, /Tor isn't installed/)
      end
    end

    context 'with tor' do
      before do
        Tor.stub(:available?).and_return(true)
        lambda {
          @tor_proxy = Tor::Proxy.new
          @socks_proxy = @tor_proxy.instance_variable_get(:@proxy)
        }.should_not raise_error
      end

      it "should not raise error" do
        lambda {
          Tor::Proxy.new
        }.should_not raise_error
      end

      it "should use localhost:9050 by default" do
        proxy = Tor::Proxy.new
        socks_proxy = proxy.instance_variable_get(:@proxy)
        socks_proxy.socks_server.should == 'localhost'
        socks_proxy.socks_port.should == 9050
      end

      it "should use custom host and port" do
        proxy = Tor::Proxy.new 'tor.local', 1337
        socks_proxy = proxy.instance_variable_get(:@proxy)
        socks_proxy.socks_server.should == 'tor.local'
        socks_proxy.socks_port.should == 1337
      end
    end
  end

  describe '#get' do
    before do
      @proxy = Tor::Proxy.new
      Net::HTTP.stub(:get).and_return('fake response')
    end

    it 'should delegate to Net::HTTP' do
      @proxy.get('http://example.com').should == 'fake response'
    end
  end
end
