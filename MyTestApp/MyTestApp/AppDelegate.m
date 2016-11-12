//
//  AppDelegate.m
//  MyTestApp
//
//  Created by Gatsby on 8/28/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MainUITableViewController.h"
#import "HcdGuideView.h"
#import "LoginTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.0/255.0 green:166.0/255.0 blue:255.0/255.0 alpha:1.0];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    //[self.window setRootViewController:[[MyNavigationController alloc] init]];

    self.window.rootViewController = [[LoginTableViewController alloc] init];//homeViewController;
    //self.window.rootViewController = [[MainUITableViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSMutableArray *images = [NSMutableArray new];
    
    [images addObject:[UIImage imageNamed:@"1"]];
    [images addObject:[UIImage imageNamed:@"2"]];
    [images addObject:[UIImage imageNamed:@"3"]];
    
//    [[HcdGuideViewManager sharedInstance] showGuideViewWithImages:images
//                                                   andButtonTitle:@"开始"
//                                              andButtonTitleColor:[UIColor whiteColor]
//                                                 andButtonBGColor:[UIColor clearColor]
//                                             andButtonBorderColor:[UIColor whiteColor]];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
