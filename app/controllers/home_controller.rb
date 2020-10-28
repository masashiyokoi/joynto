class HomeController < ApplicationController
  def index
    @messages_with_image = TimesMessage.where.not(image: nil).order(id: :desc)
    @messages = TimesMessage.order(id: :desc)
  end
end
