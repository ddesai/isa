//
//  ResultData.m
//  Dummy data for use in custom cells in ListingView
//
//  Created by Hayley Wu on 11/8/12.
//
//

#import "ResultData.h"

@implementation ResultData


static ResultData *sharedInstance = nil;

-(id)init
{
    return nil;
}

-(id)initPrivate
{
    if (self = [super init])
    {
        
        // Test (dummy) data for use in Listings
        
        NSDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Pretty House", @"title", @"San Jose", @"location",  @"2", @"bed", @"2" , @"bath" , @"3000", @"price", @"today", @"date",nil];
        
        NSDictionary *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Another House", @"title", @"San Jose", @"location",  @"2", @"bed", @"2" , @"bath" , @"2000", @"price", @"today", @"date",nil];
        
        NSDictionary *dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Home Sweet Home", @"title", @"San Jose", @"location",  @"2", @"bed", @"2" , @"bath" , @"1500", @"price", @"today", @"date",nil];
        
        
        parsedData = [NSMutableArray arrayWithObjects:dic1, dic2, dic3, nil];
    }
    return self;
}

+ (ResultData *) getData
{
    if (sharedInstance == nil)
    {
        sharedInstance = [[ResultData alloc] initPrivate];
    }
    return sharedInstance;
}

- (NSArray *) getArrayData
{
    return parsedData;
}


@end
