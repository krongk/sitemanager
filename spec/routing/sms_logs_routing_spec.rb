require "spec_helper"

describe SmsLogsController do
  describe "routing" do

    it "routes to #index" do
      get("/sms_logs").should route_to("sms_logs#index")
    end

    it "routes to #new" do
      get("/sms_logs/new").should route_to("sms_logs#new")
    end

    it "routes to #show" do
      get("/sms_logs/1").should route_to("sms_logs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sms_logs/1/edit").should route_to("sms_logs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sms_logs").should route_to("sms_logs#create")
    end

    it "routes to #update" do
      put("/sms_logs/1").should route_to("sms_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sms_logs/1").should route_to("sms_logs#destroy", :id => "1")
    end

  end
end
