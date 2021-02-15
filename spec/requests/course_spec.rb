# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'courses API', type: :request do
  let!(:admin) { create(:admin) }
  let!(:courses) { create_list(:course, 10) }
  let(:course_id) { courses.first&.id }

  # Test suite for GET /api/courses
  describe 'GET /api/courses' do
    # make HTTP get request before each example
    before { get '/api/courses', as: :json, headers: { :Authorization => "Bearer #{admin.generate_jwt}" } }


    it 'returns courses' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/courses/:id
  describe 'GET /api/courses/:id' do
    before { get "/api/courses/#{course_id}", as: :json, headers: { :Authorization => "Bearer #{admin.generate_jwt}" } }

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:course_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /api/courses
  describe 'POST /api/courses' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm' } }

    context 'when the request is valid' do
      before { post '/api/courses', params: valid_attributes, as: :json, headers: { :Authorization => "Bearer #{admin.generate_jwt}" } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for PUT /api/courses/:id
  describe 'PUT /api/courses/:id' do
    let(:valid_attributes) { { name: 'Bangla' } }

    context 'when the record exists' do
      before { put "/api/courses/#{course_id}", params: valid_attributes, as: :json, headers: { :Authorization => "Bearer #{admin.generate_jwt}" } }

      it 'updates the record' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /api/courses/:id
  describe 'DELETE /api/courses/:id' do
    before { delete "/api/courses/#{course_id}", as: :json, headers: { :Authorization => "Bearer #{admin.generate_jwt}" } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end