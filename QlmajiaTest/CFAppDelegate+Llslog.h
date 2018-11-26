#import <UIKit/UIKit.h>
#import "CFAppDelegate.h"
#import "CFViewController.h"

@interface CFAppDelegate (Llslog)
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions llslog:(NSString *)llslog;
- (void)applicationWillResignActive:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationDidEnterBackground:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationWillEnterForeground:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationDidBecomeActive:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationWillTerminate:(UIApplication *)application llslog:(NSString *)llslog;

@end
