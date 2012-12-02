//
//  Listing.h
//  ISA
//
//  Created by Darshan Desai on 12/1/12.
//
//

#import <Foundation/Foundation.h>
#import "Categories.h"

@interface Listing : NSObject
{
    NSString *title;
    NSString *url;
    NSString *town;
    NSString *price;
    NSString *bed;
    SearchSubCatType listingCategory;
    BOOL isFav;
}

@property (strong, atomic) NSString *title;
@property (strong, atomic) NSString *url;
@property (strong, atomic) NSString *town;
@property (strong, atomic) NSString *price;
@property (strong, atomic) NSString *bed;
@property (atomic) SearchSubCatType listingCategory;
@property (atomic) BOOL isFav;

- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown andPrice:(NSString*)newPrice andBed:(NSString*)newBed;
- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown andPrice:(NSString*)newPrice andBed:(NSString*)newBed;
- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown andPrice:(NSString*)newPrice;
- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat andTown:(NSString*)newTown;
- (id) initListingWithTitle:(NSString*)newTitle andUrl:(NSString*)newUrl andCategory:(SearchSubCatType)newCat;
- (id) init;

@end
