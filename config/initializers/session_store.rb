# frozen_string_literal: true
# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store,
                                       key: '_kitahub_session',
                                       expires: 1.day.from_now,
                                       same_site: 'Lax',
                                       expires_in: 1.day
