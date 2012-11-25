//
//  Locations.h
//  ISA
//
//  Created by Darshan Desai on 11/21/12.
//
//

#import <Foundation/Foundation.h>


// ============================================================
// Location Class
@interface Location : NSObject
{
    NSString *name;
    NSString *codeName;
    NSString *parent;
}

@property (strong, atomic) NSString *name;
@property (strong, atomic) NSString *codeName;
@property (strong, atomic) NSString *parent;

- (id) initLocationWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (id) initLocationWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

@end



// ============================================================
// Town Class
@interface Town : Location

- (id) initTownWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (id) initTownWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

@end



// ============================================================
// Region Class
@interface Region : Location

@property (strong, atomic) NSMutableDictionary *towns;

- (id) initRegionWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (id) initRegionWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

- (void) addTown:(Town*)t;
- (void) addTown:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (void) addTown:(NSString*)newName andCode:(NSString*)newCode;

@end


// ============================================================
// Metro Class
@interface Metro : Location

@property (strong, atomic) NSMutableDictionary *regions;

- (id) initMetroWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (id) initMetroWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

- (void) addRegion:(Region *)r;
- (void) addRegion:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (void) addRegion:(NSString*)newName andCode:(NSString*)newCode;

@end


// ============================================================
// Country Class
@interface Country : Location

@property (strong, atomic) NSMutableDictionary *metros;

- (id) initCountryWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (id) initCountryWithName:(NSString*)newName andCode:(NSString*)newCode;
- (id) init;

- (void) addMetro:(Metro *)m;
- (void) addMetro:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent;
- (void) addMetro:(NSString*)newName andCode:(NSString*)newCode;

@end



