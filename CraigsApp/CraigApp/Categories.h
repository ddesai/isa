//
//  Categories.h
//  ISA
//
//  Created by Darshan Desai on 11/20/12.
//
//

#import <Foundation/Foundation.h>

typedef enum
{
    SEARCH_INIT=-1,
    SEARCH_HOUSING,
    SEARCH_FORSALE,
    SEARCH_GIGS,
    SEARCH_RESUME,
    SEARCH_SERVICES,
    SEARCH_COMMUNITY,
    SEARCH_INVALID
} SearchSubCatType;


// SubCategory Class
@interface SubCategory : NSObject

@property (strong, atomic) NSString *parent;
@property (strong, atomic) NSString *name;
@property (strong, atomic) NSString *codeName;
@property (atomic) SearchSubCatType searchType;

- (id) initSubcatWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent andType:(SearchSubCatType)newType;
- (id) init;

@end



// Category Class
@interface Category : NSObject

@property (strong, atomic) NSString *name;
@property (strong, atomic) NSString *codeName;
@property (strong, atomic) NSMutableArray *subcats;

- (void) addSubCat:(NSString*)newName andCode:(NSString*)newCode andType:(SearchSubCatType)newType;
- (id) initCategoryWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

@end


