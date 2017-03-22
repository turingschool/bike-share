require_relative '../spec_helper'

RSpec.describe BikeShareApp do
  describe "GET #index" do
    it "should load page at root" do
      app = BikeShareApp.create
      get :index
      expect(app).to render_template(:index)
    end
  end
end
