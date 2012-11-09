//
//  TableCell.h
//
//  Created by Hayley Wu on 11/8/12.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *bedLabel;
@property (nonatomic, weak) IBOutlet UILabel *bathLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@end
