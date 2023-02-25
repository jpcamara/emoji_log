require_relative "lib/emoji_log/version"

Gem::Specification.new do |spec|
  spec.name        = "emoji_log"
  spec.version     = EmojiLog::VERSION
  spec.authors     = ["JP Camara"]
  spec.email       = ["48120+jpcamara@users.noreply.github.com"]
  spec.homepage    = "https://github.com/jpcamara/emoji_log"
  spec.summary     = "Quickly scan your logs using the power of emojis."
  spec.description = "Quickly scan your logs using the power of emojis."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jpcamara/emoji_log"
  spec.metadata["changelog_uri"] = "https://github.com/jpcamara/emoji_log"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # spec.add_dependency "rails", "~> 6.1.7", ">= 6.1.7.2"
  spec.add_dependency "rails", ">= 5.0"
end
