module CurrencyExchange
  class Engine < ::Rails::Engine
    isolate_namespace CurrencyExchange

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
