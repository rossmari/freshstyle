# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

#JS and scripts
# root
Rails.application.config.assets.precompile += %w( admin.js )
# /admin directory
Rails.application.config.assets.precompile += %w( admin/sortable_tree/sortable_pack.js)

# CSS and styles
# root
Rails.application.config.assets.precompile += %w( admin.css devise.css)
Rails.application.config.assets.precompile += %w( bootstrap_manifest.css)
# admin directory
Rails.application.config.assets.precompile += %w( admin/dashboard.css)
Rails.application.config.assets.precompile += %w( admin/sortable_tree/sortable_pack.css)
Rails.application.config.assets.precompile += %w( admin/goods_images/table.css)
#application directory
Rails.application.config.assets.precompile += %w( application/goods/index.css )
Rails.application.config.assets.precompile += %w( application/goods/show.css )
Rails.application.config.assets.precompile += %w( application/carousel.css )
