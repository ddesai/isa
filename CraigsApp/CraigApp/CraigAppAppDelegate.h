//
//  CraigAppAppDelegate.h
//  CraigApp
//
//  Created by Hayley Wu on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface CraigAppAppDelegate : UIResponder <UIApplicationDelegate>
{
}

@property (strong, nonatomic) DataModel *data;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *startTabBarController;

@end
