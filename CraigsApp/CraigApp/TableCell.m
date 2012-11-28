//
//  TableCell.m
//
//  Created by Hayley Wu on 11/8/12.
//

#import "TableCell.h"

@implementation TableCell

@synthesize titleLabel, label1, label2;

@synthesize favChecked;

@synthesize addToFavButton;


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





@end
