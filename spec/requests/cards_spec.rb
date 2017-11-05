require 'rails_helper'

RSpec.describe "Card Requests", :type => :request do

  # Creating test data
  let!(:cards) { create_list(:card, 20) }
  let(:card_id) { cards.first.id }

  # GET /cards (index)
  describe "GET /cards" do
    # Before you run example block get the cards
    before { get '/cards' }

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
    before { get '/cards/#{card_id}' }

    it 'returns a card' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(card_id)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end
  end

  # GET /cards/:id/edit(edit)
  # GET /cards/new (new)
  # POST /cards (create)
  # PATCH/PUT /cards/:id(update)
  # DELETE /products/1(destroy)

end
