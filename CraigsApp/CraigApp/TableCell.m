//
//  TableCell.m
//
//  Created by Hayley Wu on 11/8/12.
//

#import "TableCell.h"

@implementation TableCell

@synthesize titleLabel, locationLabel, priceLabel, bedLabel, bathLabel, dateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
