 Pod::Spec.new do |s|
 s.name         = "shumeiDevice_Id"
 s.version      = "1.0.0"
 s.summary      = "Unique Device Id Library"
 s.homepage     = "https://github.com/"
 s.license      = { :type => 'MIT', :file => 'LICENSE' }
 s.author       = { "xxx" => "aaa@xxx.com" }
 s.source       = { :http => "https://d3n5xqb6gw17ix.cloudfront.net/ios/smsdk_ios_2.6-2.6_normal_release.zip" }
 s.platform     = :ios, '10.0'

 # arc components
 s.requires_arc = false
# you static library`s .h file
 s.source_files = 'unique_device_id/class/include/**/*.h','unique_device_id/class/*.h'
 s.vendored_library = 'unique_device_id/class/*.a'
 s.library         = "sqlite3"
 s.library         = "libresolv"
 s.library         = "z"
 s.frameworks       = "SystemConfiguration","AdSupport","CoreMotion","Security"
end
