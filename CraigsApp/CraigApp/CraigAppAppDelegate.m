//
//  CraigAppAppDelegate.m
//  CraigApp
//
//  Created by Hayley Wu on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CraigAppAppDelegate.h"
#import "FavViewController.h"

NSString *startTab = @"startTab";

@implementation CraigAppAppDelegate

@synthesize window;
@synthesize startTabBarController;
@synthesize data;

// Initializes the Data Model
- (void) initializeData
{
    data = [[DataModel alloc] init];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self initializeData];
    self.startTabBarController = (UITabBarController *)self.window.rootViewController;
    [self.startTabBarController setDelegate:self];
    [window addSubview:startTabBarController.view];
    [window makeKeyAndVisible];
    
    NSUInteger index = [[NSUserDefaults standardUserDefaults] integerForKey:startTab];
    self.startTabBarController.selectedIndex = index;

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   /*
    Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   /*
    Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    */
    [self saveLastTab];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   /*
    Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   /*
    Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   /*
    Called when the application is about to terminate.
    Save data if appropriate.
    See also applicationDidEnterBackground:.
    */
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController.title isEqualToString:@"FavNavController"])
    {
        UINavigationController *navc = (UINavigationController *)viewController;
        FavViewController *fvc = (FavViewController *)[navc.viewControllers objectAtIndex:0];
        [fvc.tableView reloadData];
    }
}

-(void)saveLastTab
{
    NSUInteger startTabIndex = self.startTabBarController.selectedIndex;
    [[NSUserDefaults standardUserDefaults] setInteger:startTabIndex forKey:startTab];

}
@end
