require "application_responder"

class ApplicationController < ActionController::Base
  before_action :set_locale

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Set locale if available
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Add current locale to url
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
