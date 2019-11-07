Pod::Spec.new do |s|
    s.name         = "VerifyKit"
    s.version      = "0.0.1"
    s.summary      = "A brief description of VerifyKit project."
    s.description  = "VerifyKit is the newest and fastest way to mobile authentication."
    s.homepage     = "http://verifykit.com"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2018
                   Permission is granted to...
                  LICENSE
                }
    s.author             = { "VerifyKit" => "sdk@verifykit.com" }
    s.source       = { :git => "https://github.com/verifykit/verifykit-sdk-ios.git", :branch => "master", :tag => "#{s.version}" }
    s.vendored_frameworks = "VerifyKit.framework"
    s.dependency "CryptoSwift"
    s.platform = :ios
    s.swift_version = "5.1"
    s.ios.deployment_target  = '10.3'
end
