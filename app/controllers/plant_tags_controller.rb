class PlantTagsController < ApplicationController

    def new
       @plant = Plant.find(params[:plant_id]) 
       @plant_tag = PlantTag.new 
    end

    def create
        @plant = Plant.find(params[:plant_id]) 
        
        # @plant_tag = PlantTag.new(tag_id: params[:plant_tag][:tag]) 
        
        # @plant_tag.plant = @plant

        @tags = Tag.where(id: params[:plant_tag][:tag])
        
        @tags.each do |tag|
          plant_tag = PlantTag.new(plant: @plant, tag: tag)
          plant_tag.save
        end
        
        redirect_to garden_path(@plant.garden)
        

        # if @plant_tag.save
        #     redirect_to garden_path(@plant.garden)
        # else
        #     render :new
        # end
    end    
end
