//
//  FavCell.m
//  ISA
//
//  Created by Hayley Wu on 12/3/12.
//
//

#import "FavCell.h"

@implementation FavCell


@synthesize titleLabel, label1, label2;



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
