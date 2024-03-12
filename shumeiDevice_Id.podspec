Pod::Spec.new do |s|
  s.name         = "shumeiDevice_Id"
  s.version      = "1.0.7"
  s.summary      = "Unique Device Id Library"
  s.homepage     = "https://github.com/holla-world/ShumeiSDK"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "xxx" => "aaa@xxx.com" }

  s.source       = { :git => "https://github.com/holla-world/ShumeiSDK.git", :branch => 'master' }
  s.platform     = :ios, '10.0'

  # arc components
  s.requires_arc = true

  # specify individual frameworks as an array
  s.frameworks = ["SystemConfiguration", "AdSupport", "CoreMotion", "Security", "IOKit"]

  # specify xcframeworks as an array
  s.vendored_frameworks = ['SmAntiFraud.xcframework']

  # specify individual libraries as an array
  s.libraries = ["sqlite3", "resolv", "z"]

  s.ios.deployment_target = '10.0'

  # specify header files
  s.public_header_files = ['unique_device_id/Class/*.h', 'SmAntiFraud.xcframework/ios-arm64/SmAntiFraud.framework/Headers/*.h']

  # specify source files
  s.source_files = 'unique_device_id/Class/*.m'

  s.dependency "UICKeyChainStore"
end
