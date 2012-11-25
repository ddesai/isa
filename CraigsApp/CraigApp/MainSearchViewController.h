//
//  MainSearchViewController.h
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import <UIKit/UIKit.h>

@interface MainSearchViewController : UIViewController 

- (IBAction) searchCL: (id) sender;
- (IBAction) dismissKeyboard:(id)sender;
- (IBAction) dismissKeyboardOutside:(id)sender;

@property (weak) IBOutlet UILabel* appTitle;
@property (weak) IBOutlet UILabel* bedTitle;
@property (weak) IBOutlet UITextField* keyword;
@property (weak) IBOutlet UITextField* priceMin;
@property (weak) IBOutlet UITextField* priceMax;
@property (weak) IBOutlet UITextField* bedMin;
@property (weak) IBOutlet UISwitch* hasImage;

@end
