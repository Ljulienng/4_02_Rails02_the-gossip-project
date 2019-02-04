class DynamicController < ApplicationController
  def gossip
  end
  
  def welcome
  end

  def gossip_page
  end

  def user_page
    redirect_to "/" if StaticController.current_user == nil
  end
end
