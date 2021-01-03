Pod::Spec.new do |spec|

  spec.name             = "Watchlitude"
  spec.version          = "0.0.1"
  spec.summary          = "Amplitude Analytics SDK for WatchOS."

  spec.description      = <<-DESC
  This library helps you to use Amplitude Analytics on your WatchOS apps.
                   DESC

  spec.homepage         = "https://github.com/mohammad-rahchamani/Watchlitude"

  spec.license          = { :type => "MIT", :file => "LICENSE" }

  spec.author           = { "Mohammad Rahchamani" => "mohammad.rahchamani@gmail.com" }
  
  spec.platform         = :watchos, "2.0"
  
  spec.swift_version    = "5.0"

  spec.source           = { :git => "https://github.com/mohammad-rahchamani/Watchlitude.git", :tag => "#{spec.version}" }

  spec.source_files     = "Watchlitude/**/*.{swift}"

end
