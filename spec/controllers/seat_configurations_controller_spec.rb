require 'rails_helper'

RSpec.describe SeatConfigurationsController, type: :controller do
  let(:user) { create(:user) }

  context 'when user is not log in' do
    describe 'GET categories_path' do
      before { get :index }

      it 'redirects to /user/sign_in' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'when user logged in' do
    before { sign_in user }

    describe 'GET categories_path' do
      before { get :index }
      
      it "returns http success" do
        expect(response).to have_http_status(302)
      end
    end
  end

  let "when send invalid params" do
    before { sign_in user }
    post :create, { :seat_configuration => { :plane => nil, category: nil, seats_in_row: nil, number_of_rows: nil, base_price: nil }, :format => :json }
    
    it 'responds with 400 http status code' do
      expect(response).to have_http_status(400)
    end

    it 'responds with "application/json; charset=utf-8" content type' do
      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq ["Plane can't be blank", "Plane must exist", "Category can't be blank", "Seats in row can't be blank", "Seats in row is not a number", "Number of rows can't be blank", "Number of rows is not a number", "Base price can't be blank", "Base price is not a number", "Category must exist"]
    end
  end

  let 'DELETE seat_configuration_path(seat_configuration, :json)' do
    before { sign_in user }
    let(:seat_configuration) { create(:seat_configuration) }
    delete :destroy, { id: seat_configuration.id, :format => :json }

    it 'responds with 204 http status code' do
      expect(response).to have_http_status(204)
    end
  end
end
