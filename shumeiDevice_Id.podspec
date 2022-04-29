 Pod::Spec.new do |s|
 s.name         = "shumeiDevice_Id"
 s.version      = "1.0.0"
 s.summary      = "Unique Device Id Library"
 s.homepage     = "https://github.com/"
 s.license      = { :type => 'MIT', :file => 'LICENSE' }
 s.author       = { "xxx" => "aaa@xxx.com" }
 s.source       = { :git => "https://github.com/holla-world/ShumeiSDK.git",:branch => 'master' }
 s.platform     = :ios, '10.0'

 # arc components
 s.requires_arc = false
# you static library`s .h file
 s.source_files = 'unique_device_id/class/include/**/*.h','unique_device_id/class/*.h'
 s.vendored_library = 'unique_device_id/class/*.a'
 s.public_header_files = 'unique_device_id/DeviceIdImport.h'
 s.library         = "sqlite3"
 s.library         = "libresolv"
 s.library         = "z"
 s.frameworks       = "SystemConfiguration","AdSupport","CoreMotion","Security"
end
