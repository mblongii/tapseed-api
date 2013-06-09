module GetStoryboardViewers
  extend ActiveSupport::Concern

  # GET /storyboards/1/get_viewer
  def get_viewers
    @designers = @storyboard.designers.where(viewing_storyboard_id: @storyboard.id)
    @viewing = []
    @designers.each {|v| @viewing << v }
    render :json => { viewers: @viewing }
  end
end
