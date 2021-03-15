class BottomsController < ApplicationController
  def index
    matching_bottoms = Bottom.all

    @list_of_bottoms = matching_bottoms.order({ :created_at => :desc })

    render({ :template => "bottoms/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bottoms = Bottom.where({ :id => the_id })

    @the_bottom = matching_bottoms.at(0)

    render({ :template => "bottoms/show.html.erb" })
  end

  def create
    the_bottom = Bottom.new
    the_bottom.user_id = params.fetch("query_user_id")
    the_bottom.price = params.fetch("query_price")
    the_bottom.image = params.fetch("query_image")
    the_bottom.brand = params.fetch("query_brand")
    the_bottom.outfits_count = params.fetch("query_outfits_count")

    if the_bottom.valid?
      the_bottom.save
      redirect_to("/bottoms", { :notice => "Bottom created successfully." })
    else
      redirect_to("/bottoms", { :notice => "Bottom failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bottom = Bottom.where({ :id => the_id }).at(0)

    the_bottom.user_id = params.fetch("query_user_id")
    the_bottom.price = params.fetch("query_price")
    the_bottom.image = params.fetch("query_image")
    the_bottom.brand = params.fetch("query_brand")
    the_bottom.outfits_count = params.fetch("query_outfits_count")

    if the_bottom.valid?
      the_bottom.save
      redirect_to("/bottoms/#{the_bottom.id}", { :notice => "Bottom updated successfully."} )
    else
      redirect_to("/bottoms/#{the_bottom.id}", { :alert => "Bottom failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bottom = Bottom.where({ :id => the_id }).at(0)

    the_bottom.destroy

    redirect_to("/bottoms", { :notice => "Bottom deleted successfully."} )
  end
end
