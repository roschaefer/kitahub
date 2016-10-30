# Be sure to restart your server when you modify this file.

redis_url = 'redis://localhost:6379/0/session'
Rails.application.config.session_store :redis_store,
                                       key: '_kitahub_session',
                                       expires_in: 1.day,
                                       servers: redis_url
