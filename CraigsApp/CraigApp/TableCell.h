//
//  TableCell.h
//
//  Created by Hayley Wu on 11/8/12.
//

#import <UIKit/UIKit.h>


@interface TableCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *label1;
@property (nonatomic, weak) IBOutlet UILabel *label2;

@property (nonatomic, weak) IBOutlet UIButton *addToFavButton;


@property (nonatomic) BOOL favChecked;
@property (nonatomic) BOOL mapChecked;


- (IBAction) checkFav: (id) sender;


@end
