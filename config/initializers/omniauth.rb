Rails.application.config.middleware.use OmniAuth::Builder do
    if Rails.env.development? || Rails.env.test?
        provider :github, "75728e9150d9ecb77423", "68391ec7d18069ed012b3027add719913ba2c640"
    else
        provider :github,
          Rails.application.credentials.github[:client_id],
          Rails.application.credentials.github[:client_secret]
    end
end