# Be sure to restart your server when you modify this file.

redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379'
Rails.application.config.session_store :redis_store,
                                       key: '_kitahub_session',
                                       expires: 1.day.from_now,
                                       same_site: 'Lax',
                                       expires_in: 1.day,
                                       servers: "#{redis_url}/0/session"
