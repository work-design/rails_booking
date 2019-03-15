module RailsBooking
  class Engine < ::Rails::Engine

    config.eager_load_paths += Dir[
      "#{config.root}/app/models/rails_booking"
    ]

    config.factory_bot.definition_file_paths += Dir["#{config.root}/test/factories"] if defined?(FactoryBotRails)

    config.generators do |g|
      g.rails = {
        assets: false,
        stylesheets: false,
        helper: false
      }
      g.test_unit = {
        fixture: true,
        fixture_replacement: :factory_girl
      }
      g.templates.unshift File.expand_path('lib/templates', RailsCom::Engine.root)
    end

    initializer 'rails_booking.assets.precompile' do |app|
      app.config.assets.precompile += ['rails_booking_manifest.js']
    end

  end
end
