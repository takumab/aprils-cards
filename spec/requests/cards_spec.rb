require 'rails_helper'

RSpec.describe "Cards API", :type => :request do

  # Creating test data
  let!(:cards) { create_list(:card, 20) }
  let(:card_id) { cards.first.id }

  # GET /cards (index)
  describe "GET /cards" do
    # Before you run example block get the cards
    before { get '/api/v1/cards' }

    it 'returns cards' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end
  end
  # GET /cards/:id (show)
  describe "GET /cards/:id" do
    # Before you run example block get the card
    before { get "/api/v1/cards/#{card_id}"}

    it 'returns a card' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(card_id)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end
  end

  # POST /cards (create)
  describe "POST /cards" do
    let(:card_params) {{ title: 'Birthday card', description: 'Happy Birthday',
                         price: 5.99 }}

    before { post '/api/v1/cards', params: card_params }

    it "creates a card" do
      expect(response).to have_http_status(201)
    end

    it "does not create card due to invalid attributes" do
      expect(response).to have_http_status(422)
    end
  end
  # PATCH/PUT /cards/:id(update)
  describe "PUT /cards/:id" do
    let(:card_params) {{ title: 'Wedding card', description: 'Congrats!' }}
    before { put "/api/v1/cards/#{card_id}", params: card_params }

    it 'updates card' do
      expect(response.body).not_to be_empty
    end

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end
  end
  # DELETE /products/1(destroy)
  describe "DELETE /cards/:id" do
    before { delete "/api/v1/cards/#{card_id}"}

    it "returns status 204" do
      expect(response).to have_http_status(204)
    end
  end

end
