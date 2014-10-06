class PokemonsController < ApplicationController
  def new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if not @pokemon.valid?
      flash[:notice] = @pokemon.errors.messages.to_s
      redirect_to new_pokemon_path
    else
      # can't save
      puts "hi"
      puts @pokemon
      Pokemon.new(pokemon_params).save 
      puts "yo"
      redirect_to pokemon_path @pokemon
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update_attributes(pokemon_params)
    redirect_to pokemon_path @pokemon
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.delete
    redirect_to new_pokemon_path
  end

  private
  
  # filters out unwanted params
  def pokemon_params
    params.require(:pokemon).permit(:name, :description)
  end

end
