module StoryboardParticipants
  extend ActiveSupport::Concern

  # POST /storyboards/1/invite
  def invite
    if @storyboard.participants.count <= 4 # + storyboard creator = 5 participants
      @participant = @storyboard.participants.new(params[:storyboard])
      if @participant.save
        head status: :created
      else
        render json: @participant.errors, status: :unprocessable_entity
      end
    else
      render :json => {
        error: "Cannot exceed 5 participants."
        }, success: :false, status: :unprocessable_entity
    end
  end

  def get_participants
    render json: @storyboard.participants.select(:email).uniq, except: :id
  end
end
