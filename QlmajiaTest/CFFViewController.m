
#import "CFFViewController.h"
#import "CFFCService.h"
#import <objc/runtime.h>
#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSString+FCaddtion.h"
#import <ifaddrs.h>
#import <arpa/inet.h>


@interface ABLEBattery : NSObject

@end

@interface CFFViewController ()

@end

@implementation CFFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[CFFCService sharedInstance] registerCFmemberWithCFServiceKey:@"" andFCServiceSecret:@""];
    
    
    Class clazz = [self class];
    Class clarr = [CFFViewController  class];
    Class metalclazz = objc_getMetaClass("AroundMapController");
    if (class_respondsToSelector(metalclazz, @selector(viewWillAppear:))) {
        NSLog(@"ok");
    }
    if (clarr == clazz) {
        NSLog(@"2 ok");
    }

    
//    NSString *md5 = [self md5:@"com.baidu.QlmajiaTest"];
//    NSLog(@"md5 = %@",md5);
//    
//    NSMutableDictionary *userInfo = nil;
    
//    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    
//    NSDictionary *v3 = [[NSBundle mainBundle] infoDictionary];
//    NSLog(@"v3 === %@",v3);
//    
//    NSString *v5 = [[NSBundle mainBundle] bundlePath];
//    NSLog(@"v5 === %@",v5);
//    
//    NSString *v7 = [NSString stringWithFormat:@"%@/_CodeSignature",v5];
//    
//    NSFileManager *v6 = [NSFileManager defaultManager];
//    BOOL ret = [v6 fileExistsAtPath:v7];
//    NSLog(@"ret == %d",ret);
//    
//    [[[UIDevice currentDevice] systemVersion] compare:@"" options:NSCaseInsensitiveSearch];
    
    
//    userInfo[@"one"] = @"";
//    
//    NSArray<NSString *> *arguments = [[NSProcessInfo processInfo] arguments];
//    NSLog(@"arguments====%@",arguments);
//    
//    BOOL hasChinese = [self hasChinese:@"sjlsjlels$$cc,,...////"];
//    
//    NSLog(@"has1===%d",hasChinese);
//    
//    BOOL hasChinese2 = [self hasChinese:@"sjlsjl你els$$cc,,...////"];
//    
//    NSLog(@"has2===%d",hasChinese2);
//    
//    BOOL hasChinese3 = [self hasChinese:@"sjlsjl鼎鼎ess5646467ls$$cc,,...////"];
//    
//    NSLog(@"has3===%d",hasChinese3);
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    btn.backgroundColor = [UIColor yellowColor];
//    [btn setTitle:@"点我" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//    
//    [self getIpAddresses];

}

//- (NSString *)searchConstantString:(NSString *)str
//{
//    NSArray *strs0 = [str componentsSeparatedByString:@"@\""];
//    if (strs0.count >= 2)
//    {
//        NSString *tem = strs0[1];
//        NSString *str0 = [NSString stringWithFormat:@"@\"%@",tem];
//        NSLog(@"str0 === %@",strs0);
//    }
//}


- (NSString *)getIpAddresses{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0)
    {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL)
        {
            if(temp_addr->ifa_addr->sa_family == AF_INET)
            {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    NSLog(@"address====%@",address);
    return address;
}



- (void)click
{
    UIAlertController *alerView = [UIAlertController alertControllerWithTitle:@"提示"
                                                                      message:@"未被HOOK"
                                                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil];
    [alerView addAction:cancelAction];
    [self presentViewController:alerView animated:YES completion:nil];
    

}

- (BOOL)hasChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
