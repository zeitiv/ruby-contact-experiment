Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ENV['ALLOWED_ORIGINS'].split(',')
      resource '*', headers: :any, methods: [:post, :options]
    end
  end
  