class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception
  layout "layouts/admin/application"

  before_action :authenticate_manager!
end
