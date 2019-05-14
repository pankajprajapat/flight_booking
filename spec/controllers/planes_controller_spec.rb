require 'rails_helper'

RSpec.describe PlanesController, type: :controller do
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
    post :create, { :plane => { :name => nil, plane_number: nil }, :format => :json }
    
    it 'responds with 400 http status code' do
      expect(response).to have_http_status(400)
    end

    it 'responds with "application/json; charset=utf-8" content type' do
      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq ["Name can't be blank", "Plane number can't be blank"]
    end
  end

  let 'DELETE plane_path(plane, :json)' do
    before { sign_in user }
    let(:plane) { create(:plane) }
    delete :destroy, { id: plane.id, :format => :json }

    it 'responds with 204 http status code' do
      expect(response).to have_http_status(204)
    end
  end
end
