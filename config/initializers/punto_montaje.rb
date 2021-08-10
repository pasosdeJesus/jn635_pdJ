Jn635Pdj::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/mercadocampesino')
Jn635Pdj::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/mercadocampesino') + '/assets'
