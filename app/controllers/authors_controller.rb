class AuthorsController < ApplicationController
  
  def show
    @author = Gossip.find(params[:gossip_id]).author
  end
  
end