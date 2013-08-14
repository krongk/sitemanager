require 'spec_helper'

describe PageController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'protocol'" do
    it "returns http success" do
      get 'protocol'
      response.should be_success
    end
  end

  describe "GET 'right'" do
    it "returns http success" do
      get 'right'
      response.should be_success
    end
  end

  describe "GET 'join'" do
    it "returns http success" do
      get 'join'
      response.should be_success
    end
  end

  describe "GET 'subscribe'" do
    it "returns http success" do
      get 'subscribe'
      response.should be_success
    end
  end

  describe "GET 'friend_links'" do
    it "returns http success" do
      get 'friend_links'
      response.should be_success
    end
  end

end
