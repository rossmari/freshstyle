# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( admin.js application.js admin.css admin.css application.css devise.css)


#javascripts
Rails.application.config.assets.precompile += %w( admin/sortable_tree/sortable_pack.js)

#styles
Rails.application.config.assets.precompile += %w( admin/sortable_tree/sortable_pack.css)
Rails.application.config.assets.precompile += %w( admin/goods_images/table.css)
Rails.application.config.assets.precompile += %w( admin/carousel.css)
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.css)
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.css.map)