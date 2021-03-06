workers Integer(ENV['PUMA_WORKERS'] || 3)
threads Integer(ENV['MIN_THREADS'] || 1), Integer(ENV['MAX_THREADS'] || 16)

preload_app!

port        ENV['PORT'] || 3000
environment ENV['RAILS_ENV'] || 'development'
bind "unix:///#{ENV['SOCKET_PATH']}/#{ENV['APP_NAME']}.sock"

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
      Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['MAX_THREADS'] || 16

    # ActiveRecord::Base.establish_connection(config)
  end
end
