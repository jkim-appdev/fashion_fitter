class ShoesController < ApplicationController
  def index
    matching_shoes = Shoe.all

    @list_of_shoes = matching_shoes.order({ :created_at => :desc })

    render({ :template => "shoes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_shoes = Shoe.where({ :id => the_id })

    @the_shoe = matching_shoes.at(0)

    render({ :template => "shoes/show.html.erb" })
  end

  def create
    the_shoe = Shoe.new
    the_shoe.user_id = params.fetch("query_user_id")
    the_shoe.price = params.fetch("query_price")
    the_shoe.image = params.fetch("query_image")
    the_shoe.brand = params.fetch("query_brand")
    the_shoe.outfits_count = params.fetch("query_outfits_count")

    if the_shoe.valid?
      the_shoe.save
      redirect_to("/shoes", { :notice => "Shoe created successfully." })
    else
      redirect_to("/shoes", { :notice => "Shoe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_shoe = Shoe.where({ :id => the_id }).at(0)

    the_shoe.user_id = params.fetch("query_user_id")
    the_shoe.price = params.fetch("query_price")
    the_shoe.image = params.fetch("query_image")
    the_shoe.brand = params.fetch("query_brand")
    the_shoe.outfits_count = params.fetch("query_outfits_count")

    if the_shoe.valid?
      the_shoe.save
      redirect_to("/shoes/#{the_shoe.id}", { :notice => "Shoe updated successfully."} )
    else
      redirect_to("/shoes/#{the_shoe.id}", { :alert => "Shoe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_shoe = Shoe.where({ :id => the_id }).at(0)

    the_shoe.destroy

    redirect_to("/shoes", { :notice => "Shoe deleted successfully."} )
  end
end
