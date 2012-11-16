//
//  TestViewController.h
//  CraigApp
//
//  Created by Darshan Desai on 11/1/12.
//
//

#import <UIKit/UIKit.h>
#import "SearchSelectionDelegate.h"

@interface ISAMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SearchSelectionDelegate>

// pointer to the table - to access it 
@property (weak) IBOutlet UITableView* myTableView;

@end
