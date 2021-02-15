# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { create(:course) }

  describe 'GET #index' do
    context 'without a valid token' do
      before do
        request.accept = 'application/json'
        request.headers['Authorization'] = 'foo'
        get :index
      end

      it 'returns http unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a valid token' do
      let(:admin) { create(:admin) }

      before do
        request.accept = 'application/json'
        request.headers['Authorization'] = "Bearer #{admin.generate_jwt}"
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
