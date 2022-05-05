//
//  DeviceIdSwiftImport.m
//  Pods
//
//  Created by admin on 01-05-22.
//

#import "DeviceIdSwiftImport.h"
#import "SmAntiFraud.h"

@implementation DeviceIdSwiftImport
+ (void)updateAppId:(NSString *)appId{
    SmOption *options = [[SmOption alloc] init];
    [options setAppId:appId];
    NSString* host = @"https://shumei.servicecloudweb.com";
    [options setUrl:[host stringByAppendingString:@"/v3/profile/ios"]];
    [options setConfUrl:[host stringByAppendingString:@"/v3/cloudconf"]];
    [options setOrganization:@"IZf9gGUfAMI9GSg5xh0v"];
    [options setPublicKey:@"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+Tk+uhiG0PHuSP4lnqtl1xcLQCXdKAEPB22HlPVDafWHZNu3A/j4dUJ4K+LwRNLl/irJuFK0FQ8lTO4EHsdIKnUV4zaRx+fBAML5suVvUNu6x71EnIB7+gxF7eKALiAIwYCaf/Siaxc7WIyi3f8BJ0nBAnbbkj1YggfTdY0G7FQIDAQAB"];
    [[SmAntiFraud shareInstance] create:options];
}
@end
