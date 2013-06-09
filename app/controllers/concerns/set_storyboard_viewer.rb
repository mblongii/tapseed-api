module SetStoryboardViewer
  extend ActiveSupport::Concern
  include PushMessage
  # PATCH/PUT /storyboards/1/set_viewer
  def set_viewer
    @designer = @storyboard.designers.find_by(id: params[:designer])
    @designer.viewing_storyboard_id = @storyboard.id
    @designer.save
    push_message(viewers, @designer)
  end
end
