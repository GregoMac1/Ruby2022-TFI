class HomeController < ApplicationController
  before_action :require_user_logged_in!, only: [:profile]
end
