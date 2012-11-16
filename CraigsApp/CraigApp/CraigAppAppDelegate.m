//
//  CraigAppAppDelegate.m
//  CraigApp
//
//  Created by Hayley Wu on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CraigAppAppDelegate.h"

@implementation CraigAppAppDelegate

@synthesize window;
@synthesize startTabBarController;
@synthesize data;

// Initializes the Data Model
// Later this will get changed to use classes/objects
- (void) initializeData
{
    data = [[DataModel alloc] init];

    [data addSection:@"Category"];
    [data addSection:@"Location"];
    //[data addSection:@"Neighborhood"];
    //[data addSection:@"Town"];
    
    [data addRegion:@"SF Bay Areay"];
    [data addRegion:@"bakersfield"];
    [data addRegion:@"chico"];
    [data addRegion:@"fresno"];
    [data addRegion:@"gold county"];
    [data addRegion:@"hanford"];
    [data addRegion:@"humboldt"];
    [data addRegion:@"inland empire"];
    [data addRegion:@"klamath falls"];
    [data addRegion:@"las vegas"];
    [data addRegion:@"los angeles"];
    [data addRegion:@"medford"];
    [data addRegion:@"mendocino co"];
    [data addRegion:@"merced"];
    [data addRegion:@"modesto"];
    [data addRegion:@"monterey"];
    [data addRegion:@"orange co"];
    [data addRegion:@"redding"];
    [data addRegion:@"reno"];
    [data addRegion:@"roseburg"];
    [data addRegion:@"sacramento"];
    [data addRegion:@"san luis obispo"];
    [data addRegion:@"santa barbara"];
    [data addRegion:@"santa maria"];
    [data addRegion:@"siskiyou co"];
    [data addRegion:@"stockton"];
    [data addRegion:@"susanville"];
    [data addRegion:@"ventura"];
    [data addRegion:@"visalia-tulare"];
    [data addRegion:@"yuba-sutter"];

    [data addCategory:@"Apt Rental"];
    [data addCategory:@"Apt for Sale"];
    [data addCategory:@"Books for Sale"];

    [data addNeighborhood:@"all SF bay area"];
    [data addNeighborhood:@"San Francisco"];
    [data addNeighborhood:@"South Bay"];
    [data addNeighborhood:@"East Bay"];
    [data addNeighborhood:@"Peninsula"];
    [data addNeighborhood:@"North Bay"];
    [data addNeighborhood:@"Santa Cruz"];
    
    [data addTown:@"Fremont"];
    [data addTown:@"Hayward"];
    [data addTown:@"San Jose"];
    
    data.currentSection = -1;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeData]; 
   [window addSubview:startTabBarController.view];
   [window makeKeyAndVisible];

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

@end
