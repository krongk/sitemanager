require 'spec_helper'

describe "SmsLogs" do
  describe "GET /sms_logs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sms_logs_path
      response.status.should be(200)
    end
  end
end
