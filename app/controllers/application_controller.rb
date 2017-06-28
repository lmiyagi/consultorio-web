class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  def set_locale
    I18n.locale = fetch_request_locale(request.env['HTTP_ACCEPT_LANGUAGE']) || I18n.default_locale
  end

  def fetch_request_locale(locale)
    return nil unless locale.present?

    if I18n.config.available_locales.include? locale.scan(/^[a-z]{2}-[A-Z]{2}/).present?
      locale.scan(/^[a-z]{2}-[A-Z]{2}/).first
    elsif I18n.config.available_locales.include? locale.scan(/^[a-z]{2}/).present?
      locale.scan(/^[a-z]{2}/).first
    else
      nil
    end
  end
end
