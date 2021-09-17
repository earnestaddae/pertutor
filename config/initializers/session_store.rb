options = {
  key: "_pertutor_saas_session"
}

case Rails.env
when "development", "test"
  options.merge!(domain: "lvh.me")
when "production"
  options.merge!(domain: "pertutor.com")
end


# PertutorSaas::Application.config.session_store :cookie_store, options
# Rails.application.config.session_store :cookie_store, options
Rails.application.config.session_store :cookie_store,  key: options[:key], domain: options[:domain]
