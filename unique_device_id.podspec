 Pod::Spec.new do |s|
 s.name         = "unique_device_id"
 s.version      = "1.0.4"
 s.summary      = "Unique Device Id Library"
 s.homepage     = "https://github.com/"
 s.license      = { :type => 'MIT', :file => 'LICENSE' }
 s.author       = { "xxx" => "aaa@xxx.com" }
 s.source       = { :git => "https://github.com/holla-world/ShumeiSDK.git",:branch => 'master' }
 s.platform     = :ios, '10.0'

 # arc components
 s.requires_arc = true
# you static library`s .h file
# s.vendored_library = 'unique_device_id/Class/libSmAntiFraud.a'
 s.source_files = 'unique_device_id/Class/*.{h,m}'
 # s.source_files = 'unique_device_id/Class/*.m}'
 # s.public_header_files = 'unique_device_id/Class/*.h'
 s.public_header_files = 'unique_device_id/Class/shumeiDevice_Id.h','unique_device_id/Class/SmAntiFraud.h'
 s.library         = "sqlite3"
 s.library         = "libresolv"
 s.library         = "z"
 s.frameworks       = "SystemConfiguration","AdSupport","CoreMotion","Security"
 s.dependency 'shumeiDevice_Id'
end


#pod trunk push --use-libraries  --skip-import-validation --allow-warnings
