//
//  DeviceIdSwiftImport.m
//  Pods
//
//  Created by admin on 01-05-22.
//

#import "DeviceIdSwiftImport.h"
#import <SmAntiFraud/SmAntiFraud.h>
#import <UICKeyChainStore/UICKeyChainStore.h>

@interface DeviceIdSwiftImport()<ServerSmidProtocol> {
    
}
@property (nonatomic, copy) NSString *smDeviceId;
@end

@implementation DeviceIdSwiftImport
+ (void)updateAppId:(NSString *)appId{
    NSString * sid = [UICKeyChainStore stringForKey:@"smServerId"];
    if (sid == NULL) {
        SmOption *options = [[SmOption alloc] init];
        [options setAppId:appId];
        NSString* host = @"https://shumei.servicecloudweb.com";
        [options setUrl:[host stringByAppendingString:@"/v3/profile/ios"]];
        [options setConfUrl:[host stringByAppendingString:@"/v3/cloudconf"]];
        [options setOrganization:@"IZf9gGUfAMI9GSg5xh0v"];
        [options setPublicKey:@"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+Tk+uhiG0PHuSP4lnqtl1xcLQCXdKAEPB22HlPVDafWHZNu3A/j4dUJ4K+LwRNLl/irJuFK0FQ8lTO4EHsdIKnUV4zaRx+fBAML5suVvUNu6x71EnIB7+gxF7eKALiAIwYCaf/Siaxc7WIyi3f8BJ0nBAnbbkj1YggfTdY0G7FQIDAQAB"];
        [[SmAntiFraud shareInstance] create:options];
        
        [SmAntiFraud.shareInstance  registerServerIdCallback:[DeviceIdSwiftImport current]];
    }
}
+ (NSString *) deviceId {
    if ([DeviceIdSwiftImport current].smDeviceId != NULL) {
        return [DeviceIdSwiftImport current].smDeviceId;
    }
    NSString * sid = [UICKeyChainStore stringForKey:@"smServerId"];
    if (sid != NULL) {
        [DeviceIdSwiftImport current].smDeviceId = sid;
        return sid;
    }
    NSString * cid = [SmAntiFraud.shareInstance getDeviceId];
    if (cid != NULL) {
        return cid;
    }
    return @"";
}
- (void)smOnSuccess:(NSString *)serverId {
    [UICKeyChainStore setString:serverId forKey:@"smServerId"];
}
- (void)smOnError:(NSInteger)errorCode {
    
}
+(instancetype)current {
    static DeviceIdSwiftImport *_modelManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _modelManager = [[self alloc] init];
    });
    return _modelManager;
}
@end
