class DashboardController < ApplicationController


  before_filter :set_active_tab

  def index

    @dashboard_page = true

  end

  def statistics
    back_path = root_path
  end  

  private
  def set_active_tab
    @active_tab = "dashboard"
  end

end



