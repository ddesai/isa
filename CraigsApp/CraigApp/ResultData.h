//
//  ResultData.h
//  Dummy data for use in custom cells in ListingView
//
//  Created by Hayley Wu on 11/8/12.
//  
//

#import <Foundation/Foundation.h>

@interface ResultData : NSObject
{
    NSMutableArray *parsedData;
}

+(ResultData *)getData; // like a constructor
-(NSArray *) getArrayData;


@end
