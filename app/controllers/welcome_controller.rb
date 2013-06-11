class WelcomeController < ApplicationController
  skip_before_filter :authenticate!

  def index
    render :json => {
      description: 'Tapseed: Get the whole team involved in the design process.',
      info: 'http://tapseed.co/'
    }
  end
end
