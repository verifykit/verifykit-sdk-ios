Pod::Spec.new do |s|
    s.name         = "VerifyKit"
    s.version      = "0.7.0"
    s.summary      = "VerifyKit: Phone number validation SDK, without the needs of user input."
    s.description  = "VerifyKit is the next gen phone number validation system. Users can easily verify their  phone numbers without the need of entering phone number or a pin code."
    s.homepage     = "http://verifykit.com"
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "VerifyKit" => "sdk@verifykit.com" }
    s.source       = { :git => "https://github.com/verifykit/verifykit-sdk-ios.git", :branch => "master", :tag => "#{s.version}" }
    s.homepage     = "https://verifykit.com"
    s.vendored_frameworks = "VerifyKit.xcframework"
    s.platform = :ios
    s.swift_version = "5.5"
    s.ios.deployment_target  = '11.0'
    # s.pod_target_xcconfig = {
    # 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    # }
    # s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
