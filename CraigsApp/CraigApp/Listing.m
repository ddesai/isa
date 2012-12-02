//
//  Listing.m
//  ISA
//
//  Created by Darshan Desai on 12/1/12.
//
//

#import "Listing.h"

// ============================================================
// Location Class
@implementation Listing : NSObject

@synthesize title, url, town, price, bed, listingCategory;

// designated init
- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown andPrice:(NSString*)newPrice andBed:(NSString*)newBed
{
    self = [super init];
    if (self) {
        title = newTitle;
        url = newUrl;
        town = newTown;
        price = newPrice;
        bed = newBed;
        listingCategory = newCat;
        isFav = NO;
    }
    return self;
}

- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown andPrice:(NSString*)newPrice
{
    return [self initListingWithTitle:newTitle andUrl:newUrl andCategory:newCat andTown:newTown andPrice:newPrice andBed:nil];
}

- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown
{
    return [self initListingWithTitle:newTitle andUrl:newUrl andCategory:newCat andTown:newTown andPrice:nil andBed:nil];
}

- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat
{
    return [self initListingWithTitle:newTitle andUrl:newUrl andCategory:newCat andTown:nil andPrice:nil andBed:nil];
}

- (id) init
{
    return [self initListingWithTitle:@"TITLE" andUrl:@"URL" andCategory:-1 andTown:@"TOWN" andPrice:nil andBed:nil];
}

@end
