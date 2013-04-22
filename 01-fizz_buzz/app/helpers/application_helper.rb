module ApplicationHelper
  def display_flash
    return nil if flash[:error].blank? && flash[:warning].blank? && flash[:notice].blank? && flash[:alert].blank?

    if flash[:notice].present?
      buffer = '<div data-alert="" class="alert-box radius success">'
      buffer << flash[:notice]
    elsif flash[:alert].present?
      buffer = '<div data-alert="" class="alert-box radius alert">'
      buffer << flash[:alert]
    elsif flash[:warning].present?
      buffer = '<div data-alert="" class="alert-box radius alert">'
      buffer << flash[:warning]
    elsif flash[:error].present?
      buffer = '<div data-alert="" class="alert-box radius alert">'
      buffer << "<strong>Uh oh!</strong> #{flash[:error]}"
    end

    buffer << '<a href="" class="close">×</a></div>'
    buffer.html_safe
  end
end
