# config/initializers/i18n.rb
module UseKeyForMissing
  def call(exception, locale, key, options)
    if exception.is_a?(I18n::MissingTranslation)
      RIO_LOGGER.info("missing translation") {key}
      key
    else
      super
    end
  end
end

I18n.exception_handler.extend UseKeyForMissing