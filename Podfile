# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!
target 'unique_device_id' do
  # Comment the next line if you don't want to use dynamic frameworks


  # Pods for unique_device_id
  use_frameworks! :linkage => :static
  pod "UICKeyChainStore"
   pod 'shumeiDevice_Id', :path => "./"
# pod 'Unique_Device_Id'
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
    end
  end
end

end
