# frozen_string_literal: true

# require 'exception_notification/sidekiq'

ExceptionTrack.configure do
  # environments for store Exception log in to database.
  # default: [:development, :production]
  # self.environments = %i(development production)
  self.environments = %i(production)
end

require 'exception_notification/sidekiq'
ExceptionNotification.configure do |config|
  # ignored_exceptions 是 Ruby China 的配置，可以参考一下
  config.ignored_exceptions += %w(ActionView::TemplateError
                                  ActionController::InvalidAuthenticityToken
                                  ActionController::BadRequest
                                  ActionView::MissingTemplate
                                  ActionController::UrlGenerationError
                                  ActionController::UnknownFormat)

  # Email notifier sends notifications by email.
  config.add_notifier :email, {
    :email_prefix         => "[ERROR] ",
    :sender_address       => %{"Notifier" <notifier@example.com>},
    :exception_recipients => %w{guohang12138@gmail.com}
  }
end
