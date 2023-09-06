//
//  DeviceIdSwiftImport.h
//  Pods
//
//  Created by admin on 01-05-22.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface DeviceIdSwiftImport : NSObject
+ (void)updateAppId:(NSString *)appId;
// 获取数美id
+ (NSString *) deviceId;
@end

NS_ASSUME_NONNULL_END
