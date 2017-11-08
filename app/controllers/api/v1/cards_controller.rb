class Api::V1::CardsController < Api::V1::ApiController

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

  private

  def card_params
    params.require(:card).permit(:title, :description, :price)
  end
end
