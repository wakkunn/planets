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
end