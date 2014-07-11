require "spec_helper"

describe "SauceWhisk::Sauce", :vcr => {:cassette_name => "info"}  do
  describe "#service_status"do
    it "calls the correct URI" do
      SauceWhisk::Sauce.service_status
      assert_requested :get, "https://saucelabs.com/rest/v1/info/status"
    end

    it "returns a hash" do
      expect( SauceWhisk::Sauce.service_status ).to be_a_kind_of Hash
    end

    it "symbolizes the keys" do
      SauceWhisk::Sauce.service_status.each do |k,v|
        expect( k ).to be_an_instance_of Symbol
      end
    end
  end

  describe "#test_count" do
    it "calls the correct URI" do
      SauceWhisk::Sauce.total_job_count
      assert_requested :get, "https://saucelabs.com/rest/v1/info/counter"
    end

    it "returns an integer" do
      expect( SauceWhisk::Sauce.total_job_count ).to be_a_kind_of Integer
    end
  end

  describe "#platforms" do
    it "calls the correct URI" do
      SauceWhisk::Sauce.platforms
      assert_requested :get, "https://saucelabs.com/rest/v1/info/browsers/webdriver"
    end

    it "only calls the api once" do
      SauceWhisk::Sauce.instance_variable_set(:@platforms, nil)
      SauceWhisk::Sauce.platforms
      SauceWhisk::Sauce.platforms
      assert_requested :get, "https://saucelabs.com/rest/v1/info/browsers/webdriver"
    end

    it "returns an array" do
      platforms = SauceWhisk::Sauce.platforms
      expect( platforms ).to be_a_kind_of Array
    end

    context "when called with true" do
      it "calls the API each time" do
        SauceWhisk::Sauce.instance_variable_set(:@platforms, nil)
        SauceWhisk::Sauce.platforms
        SauceWhisk::Sauce.platforms(true)

        assert_requested :get, "https://saucelabs.com/rest/v1/info/browsers/webdriver", :times => 2
      end
    end
  end

  describe "operational?" do
    it "returns true when the service is running" do
      expect( SauceWhisk::Sauce.operational? ).to be true
    end
  end
end