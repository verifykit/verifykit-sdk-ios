Pod::Spec.new do |s|
    s.name         = "VerifyKit"
    s.version      = "0.0.9"
    s.summary      = "VerifyKit: Phone number validation SDK, without the needs of user input."
    s.description  = "VerifyKit is the next gen phone number validation system. Users can easily verify their  phone numbers without the need of entering phone number or a pin code."
    s.homepage     = "http://verifykit.com"
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "VerifyKit" => "sdk@verifykit.com" }
    s.source       = { :git => "https://github.com/verifykit/verifykit-sdk-ios.git", :branch => "master", :tag => "#{s.version}" }
    s.homepage     = "https://verifykit.com"
    s.vendored_frameworks = "VerifyKit.framework"
    s.dependency "CryptoSwift"
    s.platform = :ios
    s.swift_version = "5.1"
    s.ios.deployment_target  = '10.3'
end
