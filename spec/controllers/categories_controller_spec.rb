require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
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
    post :create, { :category => { :name => nil, category_code: nil }, :format => :json }
    
    it 'responds with 400 http status code' do
      expect(response).to have_http_status(400)
    end

    it 'responds with "application/json; charset=utf-8" content type' do
      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq ["Name can't be blank", "Category code can't be blank", "Category code is the wrong length (should be 2 characters)"]
    end
  end

  let "when send valid params" do
    before { sign_in user }
    post :create, { :category => { :name => "Economy Class", category_code: "EC" }, :format => :json }
    
     it 'responds with 200 http status code' do
      expect(response).to have_http_status(200)
    end

    it 'responds with "application/json; charset=utf-8" content type' do
      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end
  end

  let 'DELETE category_path(category, :json)' do
    before { sign_in user }
    let(:category) { create(:category) }
    delete :destroy, { id: category.id, :format => :json }

    it 'responds with 204 http status code' do
      expect(response).to have_http_status(204)
    end
  end
end
