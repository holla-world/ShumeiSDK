//
//  Copyright © 2017年 shumei. All rights reserved.
//  Pingshun Wei<weipingshun@ishumei.com>
//

#ifndef SM_ANTI_FRAUD_H
#define SM_ANTI_FRAUD_H

#import <Foundation/Foundation.h>

#define ERROR_NO_NETWORK     -1
#define ERROR_NO_RESPONSE    -2
#define ERROR_SERVER_RESPONSE    -3
#define ERROR_UNKNOW    -4

//area
typedef NS_ENUM(NSUInteger, SmAntiFraudArea){
    AREA_BJ =  0,
    AREA_XJP = 1,
    AREA_FJNY = 2
};
// 回调类
@protocol  ServerSmidProtocol <NSObject>
/**
 * 成功回调函数
 */
@required - (void)smOnSuccess:(NSString*) serverId;

/**
 * 异常回调函数
 */
@required - (void)smOnError:(NSInteger) errorCode;
@end

// 数美反欺诈SDK配置类
@interface SmOption : NSObject
@property(readwrite,nonatomic) NSString *organization;
@property(readwrite,nonatomic) NSString *channel;
@property(readwrite,nonatomic) BOOL transport;
@property(readwrite,nonatomic) BOOL cloudConf;
@property(readwrite,nonatomic) NSString *url;
@property(readwrite,nonatomic) NSString *confUrl;
@property(readwrite,nonatomic) NSString *trackerUrl;
@property(readwrite,nonatomic) NSString *appId;
@property(readwrite,nonatomic, weak) id<ServerSmidProtocol> delegate;
@property(readwrite,nonatomic) BOOL useHttps;
@property(readwrite,nonatomic) NSString *publicKey;
@property(readwrite,nonatomic) NSArray *notCollect;
@property(readwrite,nonatomic) SmAntiFraudArea area;
@property(readwrite,nonatomic) NSString *extraInfo;
@end



// 错误码
#define SM_AF_SUCCESS                  0
#define SM_AF_ERROR_OPTION_NULL        1
#define SM_AF_ERROR_ORIGNATION_BLANK   2
#define SM_AF_ERROR_ID_COLLECTOR       3
#define SM_AF_ERROR_SEQ_COLLECTOR      4
#define SM_AF_ERROR_BASE_COLLECTOR     5
#define SM_AF_ERROR_FINANCE_COLLECTOR  6
#define SM_AF_ERROR_TRACKER            7
#define SM_AF_ERROR_UNINIT             8
#define SM_AF_ERROR_SPEC_COLLECTOR     9
#define SM_AF_ERROR_CORE_COLLECTOR    10
#define SM_AF_ERROR_SENSOR_COLLECTOR    11


// 处理模式
#define SM_AF_SYN_MODE  0     // 同步模式
#define SM_AF_ASYN_MODE 1    // 异步模式

// 数美反欺诈SDK主类
@interface SmAntiFraud : NSObject {
    __weak id<ServerSmidProtocol> _idDelegate;
}
@property(readwrite, weak) id<ServerSmidProtocol> idDelegate;

/**
 * 单例模式
 * 优点:
 * 1. 只需要初始化一次，任意任意调用。
 * 2. 不用传递SmAntiFraud对象。
 */
+(instancetype) shareInstance;

/**
 * 获取SDK版本信息
 */
+(NSString*) getSDKVersion;

/**
 * 获取deviceId的类型
 * 参数：deviceId，通过getDeviceId()返回的deviceId
 * 返回值：deviceId类型，1-伪造id，2-本地id，3-服务端id，-1-获取id类型失败
 */
+(NSInteger) checkDeviceIdType:(NSString*) deviceId;

/**
 * 初始化接口
 */
-(void) create:(SmOption*) opt;

+(void) destroy;

- (long) getCost;

/**
 * 获取设备ID
 *
 * 返回值：成功：返回deviceId，失败：返回空字符串
 */
-(NSString*) getDeviceId;
-(BOOL) setDeviceIdWithStr:(NSString*)devId;

/**
 * 注册callback，当 server id 的获取后回调通知app
 */
-(void) registerServerIdCallback:(id<ServerSmidProtocol>) delegate;

-(BOOL) setCloudConfigWithStr:(NSString*)detail;

/**
 * 获取基础信息相关接口
 *
 * 异步模式: 返回空字符串。
 * 同步模式：成功：返回基础数据。 失败：返回空字符串。
 */
-(NSString*) getBase:(int) mode;
-(NSString*) getBaseSyn;

-(SmOption *) getOption;


@end
#endif

