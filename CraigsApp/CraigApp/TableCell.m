//
//  TableCell.m
//
//  Created by Hayley Wu on 11/8/12.
//

#import "TableCell.h"

@implementation TableCell

@synthesize titleLabel, locationLabel, priceLabel, bedLabel, bathLabel, dateLabel;

@synthesize favChecked, mapChecked;

@synthesize addToFavButton, addToMapButton;


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



- (IBAction) checkFav:(id)sender
{
	self.favChecked= !self.favChecked; // toggles
	UIImage *favCheckedImage = (self.favChecked) ? [UIImage imageNamed:@"checked.png"] : [UIImage imageNamed:@"unchecked.png"];
	[addToFavButton setImage:favCheckedImage forState:UIControlStateNormal];
}


- (IBAction) checkMap: (id) sender;
{
    self.mapChecked = !self.mapChecked; // toggles
	UIImage *mapCheckedImage = (self.mapChecked) ? [UIImage imageNamed:@"checked.png"] : [UIImage imageNamed:@"unchecked.png"];
	[addToMapButton setImage:mapCheckedImage forState:UIControlStateNormal];
}



@end
