require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  let(:user) { create(:user) }

  context 'when user is not log in' do
    describe 'GET flights_path' do
      before { get :index }

      it 'redirects to /user/sign_in' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'when user logged in' do
    before { sign_in user }

    describe 'GET flights_path' do
      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(302)
      end
    end
  end

  let "when send invalid params" do
    before { sign_in user }
    post :create, { :flight => { :plane => nil, origin: nil, destination: nil }, :format => :json }
    
    it 'responds with 400 http status code' do
      expect(response).to have_http_status(400)
    end

    it 'responds with "application/json; charset=utf-8" content type' do
      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq ["Plane must exist", "Plane can't be blank", "Origin can't be blank", "Destination can't be blank"]
    end
  end

  let 'DELETE flight_path(flight, :json)' do
    before { sign_in user }
    let(:flight) { create(:flight) }
    delete :destroy, { id: flight.id, :format => :json }

    it 'responds with 204 http status code' do
      expect(response).to have_http_status(204)
    end
  end
end
