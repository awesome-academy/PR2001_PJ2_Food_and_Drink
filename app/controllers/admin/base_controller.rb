class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception
  layout "layouts/admin/application"
end
