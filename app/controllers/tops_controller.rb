class TopsController < ApplicationController
  def index
    matching_tops = Top.all

    @list_of_tops = matching_tops.order({ :created_at => :desc })

    render({ :template => "tops/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tops = Top.where({ :id => the_id })

    @the_top = matching_tops.at(0)

    render({ :template => "tops/show.html.erb" })
  end

  def create
    the_top = Top.new
    the_top.user_id = params.fetch("query_user_id")
    the_top.price = params.fetch("query_price")
    the_top.image = params.fetch("query_image")
    the_top.brand = params.fetch("query_brand")
    the_top.outfits_count = params.fetch("query_outfits_count")

    if the_top.valid?
      the_top.save
      redirect_to("/tops", { :notice => "Top created successfully." })
    else
      redirect_to("/tops", { :notice => "Top failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_top = Top.where({ :id => the_id }).at(0)

    the_top.user_id = params.fetch("query_user_id")
    the_top.price = params.fetch("query_price")
    the_top.image = params.fetch("query_image")
    the_top.brand = params.fetch("query_brand")
    the_top.outfits_count = params.fetch("query_outfits_count")

    if the_top.valid?
      the_top.save
      redirect_to("/tops/#{the_top.id}", { :notice => "Top updated successfully."} )
    else
      redirect_to("/tops/#{the_top.id}", { :alert => "Top failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_top = Top.where({ :id => the_id }).at(0)

    the_top.destroy

    redirect_to("/tops", { :notice => "Top deleted successfully."} )
  end
end
