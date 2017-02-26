class PagesController < ApplicationController
  def home
    if current_user
      render 'dashboard'
    else
      render 'home'
    end
  end
  
  def show
    if valid_page?
        render template: "pages/#{params[:page_name]}"
    else
        render file: "public/404.html", status: :not_found
    end
  end
  
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page_name]}.html.erb"))
  end
end