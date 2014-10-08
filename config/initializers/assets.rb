# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

#JS and scripts
Rails.application.config.assets.precompile += %w( admin.js application.js )
Rails.application.config.assets.precompile += %w( sortable_pack.js )

# CSS and styles
Rails.application.config.assets.precompile += %w( bootstrap_manifest.css sortable_pack.css )
Rails.application.config.assets.precompile += %w( admin.css application.css devise.css )
