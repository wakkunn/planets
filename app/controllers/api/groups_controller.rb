class Api::GroupsController < ApplicationController
  respond_to :xml, :json
  
  def index
    @groups = Group.order("created_at DESC")
    respond_to do |format|
      format.json { render:json => @groups.to_json }
      format.xml do
        render :xml => @groups.to_xml(
          :only => [ 
            :id, :name
          ],
          :skip_types => true
        )
      end
    end
  end
  
  def show
    @group = Group.find(params[:id])
    respond_to do |format|
      format.xml do
        render :xml => @group.to_xml(
          :only => [ :id, :name ],
          :skip_types => true,
          :include => [ :users ]
        )
      end
      format.json { render:json => @group.as_json_with_image }
    end
  end
end