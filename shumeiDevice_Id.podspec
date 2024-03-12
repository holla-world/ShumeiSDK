 Pod::Spec.new do |s|
 s.name         = "shumeiDevice_Id"
 s.version      = "1.0.7"
 s.summary      = "Unique Device Id Library"
 s.homepage     = "https://github.com/"
 s.license      = { :type => 'MIT', :file => 'LICENSE' }
 s.author       = { "xxx" => "aaa@xxx.com" }
 s.source       = { :git => "https://github.com/holla-world/ShumeiSDK.git",:branch => 'master' }
 s.platform     = :ios, '10.0'

 # arc components
 s.requires_arc = true
# you static library`s .h file

 s.source_files = 'unique_device_id/Class/**/*.{h,m}'
 s.public_header_files = 'unique_device_id/Class/shumeiDevice_Id.h','unique_device_id/Class/SmAntiFraud.h','unique_device_id/Class/DeviceIdSwiftImport.h'
 s.library         = "sqlite3"
 s.library         = "libresolv"
 s.library         = "z"
 s.frameworks       = "SystemConfiguration","AdSupport","CoreMotion","Security", "IOKit.framework"
 s.ios.deployment_target    = '10.0'
 s.ios.vendored_framework = 'unique_device_id/Class/*.framework'
 s.dependency "UICKeyChainStore"
end


#pod trunk push --use-libraries  --skip-import-validation --allow-warnings
