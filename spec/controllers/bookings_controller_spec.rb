require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:user) { create(:user) }

  context 'when user is not log in' do
    describe 'GET bookings_path' do
      before { get :index }

      it 'redirects to /user/sign_in' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'when user logged in' do
    before { sign_in user }

    describe 'GET bookings_path' do
      before { get :index }

      it 'get booking index' do
        expect(response.status).to eq(200)
      end
    end
  end

  let "when send invalid params" do
    before { sign_in user }
    post :create, { :booking => { :user => nil, flight: nil, seat_configuration: nil, row_number: nil, seat_number: nil, total_fare: nil, pnr_number: nil }, :format => :json }
    
    it 'responds with 400 http status code' do
      expect(response).to have_http_status(400)
    end

    it 'responds with "application/json; charset=utf-8" content type' do
      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq ["User can't be blank", "User must exist", "Flight can't be blank", "Flight must exist", "Seat configuration can't be blank", "Seat configuration must exist", "Row number can't be blank", "Seat number can't be blank", "Total fare can't be blank"]
    end
  end

  let 'DELETE booking_path(booking, :json)' do
    before { sign_in user }
    let(:booking) { create(:booking) }
    delete :destroy, { id: booking.id, :format => :json }

    it 'responds with 204 http status code' do
      expect(response).to have_http_status(204)
    end
  end
end
