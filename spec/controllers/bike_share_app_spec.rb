describe BikeShareApp do

  describe 'get routes' do
    describe "/" do
      it "loads without error" do
        get '/'

        expect(last_response).to be_ok
      end
    end
    describe "/stations" do
      it "loads without error" do
        get '/stations'

        expect(last_response).to be_ok
      end
    end
    describe "/stations/new" do
      it "loads without error" do
        get '/stations/new'

        expect(last_response).to be_ok
      end
    end

  end

end
