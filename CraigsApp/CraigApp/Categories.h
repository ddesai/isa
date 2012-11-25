//
//  Categories.h
//  ISA
//
//  Created by Darshan Desai on 11/20/12.
//
//

#import <Foundation/Foundation.h>

// SubCategory Class
@interface SubCategory : NSObject

@property (strong, atomic) NSString *parent;
@property (strong, atomic) NSString *name;
@property (strong, atomic) NSString *codeName;

- (id) initSubcatWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (id) init;

@end



// Category Class
@interface Category : NSObject

@property (strong, atomic) NSString *name;
@property (strong, atomic) NSString *codeName;
@property (strong, atomic) NSMutableDictionary *subcats;

- (void) addSubCat:(NSString*)newName andCode:(NSString*)newCode;
- (id) initCategoryWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

@end


