# puma_docker.rb:

threads 4, 16
workers 1
# environment 'production'
environment 'development'
bind 'tcp://0.0.0.0:3050'
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
