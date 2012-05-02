# encoding: utf-8

require 'spec_helper'

describe Api::AnnouncementsController do
  render_views
  
  include IntegrationTestHelper
  let(:announcement) { FactoryGirl.create(:announcement) }
  
  before do
    announcement
  end
  
  describe "#index (json)" do   
    it "jsonデータを返す" do
      get :index, :format => "json"
      arr = JSON.parse(response.body)
      arr[0]["id"].should == announcement.id
      arr[0]["subject"].should == announcement.subject
      arr[0]["content"].should == announcement.content
    end
  end
end