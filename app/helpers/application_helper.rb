module ApplicationHelper
# Implementación de flash_messages basada en
# https://github.com/seyhunak/twitter-bootstrap-rails/blob/master/app/helpers/bootstrap_flash_helper.rb 
# para facilitar el formateo/despliegue de mensajes flash en la interfaz

  BOOTSTRAP_FLASH_MSG = {
    success: 'success',
    error: 'danger',
    alert: 'warning',
    notice: 'info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end
 
  def flash_messages(opts = {})
    flash_messages = []

    flash.each do |type, message|
      next if message.blank?

      type = bootstrap_class_for type

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
