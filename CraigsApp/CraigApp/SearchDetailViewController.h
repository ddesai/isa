//
//  SearchDetailViewController.h
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import <UIKit/UIKit.h>
#import "SearchSelectionDelegate.h"

@interface SearchDetailViewController : UITableViewController
{
    id <SearchSelectionDelegate> searchDelegate;
}

@property (nonatomic) id <SearchSelectionDelegate> searchDelegate;

@end
