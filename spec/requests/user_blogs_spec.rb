require 'spec_helper'

describe "UserBlogs" do
  describe "GET /user_blogs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_blogs_path
      response.status.should be(200)
    end
  end
end
