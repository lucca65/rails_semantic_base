class HomeController < ApplicationController
  def index
    admin_user = AdminUser.find(current_admin_user.id)
    messages_user =  admin_user.messages

    messages_user.each do |message|
      message_text = '<li>' + message.text + '</li>'
      if message.message_type == 'warning'
        flash.now[:message_warning] == nil ? flash[:message_warning] = message_text : flash[:message_warning] << message_text
      elsif message.message_type == 'news'
        flash[:message_news] == nil ? flash[:message_news] = message_text : flash[:message_news] << message_text
      else
        flash[:message] == nil ? flash[:message] = message_text : flash[:message] << message_text
      end
      MessagesUser.where(message_id: message.id, admin_user_id: admin_user.id).destroy_all
    end
  end
end
