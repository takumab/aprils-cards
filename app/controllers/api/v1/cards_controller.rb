class Api::V1::CardsController < ApplicationController

  def index
    cards = Card.all
    render json: cards
  end

  def show
    card = Card.find(params[:id])
    render json: card
  end

  def create
    card = Card.new(card_params)
    if card.save
      head 200
    else
      head 500
    end
  end

  def update
    card = Card.find(params[:id])
    if card.update(card_params)
      render as_json(card), status: :ok
    else
      render json: card.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def card_params
    params.require(:card).permit(:title, :description, :price)
  end
end
