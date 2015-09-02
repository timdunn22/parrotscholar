require File.expand_path('../boot', __FILE__)

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Parrotscholar
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(#{config.root}/lib)


    $styles = ["instant_messaging", "video_conferencing", "screen_sharing",
      "file_sharing", "audio"]
    $subjects = ["Technology", "Business & Entrepreneurship",
         "Finance & Economics", "Humanities and Social Sciences",
    "Mathematics", "Fine Arts", "Biology and Medicine",
    "Agriculture and Environment", "Language and Culture", "Astronomy"]
    $genders = ["male","female"]
    $education_levels = ["not specified", "some high school", "high school graduate or diploma", "some college", "associates degree", "bachelors degree", "post graduate degree"]
    $core_user_types = ["teacher", "entrepreneur", "student"]
    $booleans = [true,false]
    $course_negotiate = ["I am willing to negotiate prices", "I will only teach with set prices", "Am willing to consider either", "Not decided"]
    $course_kind = ["self paced", "instructor paced",""]
    # config.autoload_paths += %W(#{config.root}/lib/faker)
  end
end
