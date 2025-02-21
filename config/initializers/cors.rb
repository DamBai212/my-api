Rails.application.config.middleware.insert_before 0, Rack::Cors, logger: (-> { Rails.logger }) do
  allow do
    origins (ENV["CORS_DOMAINS"] || "").split(",").map { |d| /#{d}/ }
      resource(
      "/api/*",
      headers: :any,
      methods: %i[get options head],
      max_age: 0
    )
  end
end
