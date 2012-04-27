class Api::AnnouncementsController < ApplicationController
  respond_to :xml, :json
  
  def index
    respond_with(
      Announcement.order("created_at DESC"),
      :only => [ :id, :subject, :content ],
      :skip_types => true
    )
  end
end
