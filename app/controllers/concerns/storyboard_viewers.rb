module StoryboardViewers
  extend ActiveSupport::Concern
  include PushMessage

  # GET /storyboards/1/get-viewers
  def get_viewers
    @designers = Designer.where(viewing_storyboard_id: @storyboard.id)
    @viewing = []
    @designers.each {|v| @viewing << v }
    render :json => { viewers: @viewing }, except: :auth_token
  end

  # PATCH/PUT /storyboards/1/set-viewer
  def set_viewer
    @designer = Designer.find_by(auth_token: request.headers["Auth-Token"])
    @designer.viewing_storyboard_id = @storyboard.id
    @designer.save
    push_message('viewer', @designer)
  end
end
