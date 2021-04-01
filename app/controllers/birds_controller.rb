class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # slice won't work for an array of hashes
    # so we can use only: or except:
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
    render json: bird, only: [:id, :name, :species]
    # can also be written as:
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    # or as:
    # render json: bird.slice(:id, :name, :species)
  else
    render json: { message: 'Bird not found' }
  end
  end

end