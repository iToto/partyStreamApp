//
//  PSModelTests.m
//  PSModelTests
//
//  Created by Mike De Wolfe on 2013-06-13.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import "PSModelTests.h"

#import "PSEventDefaults.h"
#import "PSEvent.h"
#import "PSLocation.h"
#import "PSResponse.h"
#import "PSEImageResponse.h"

#pragma mark -
#pragma mark FAIL MESSAGES

NSString * const kPSMTShouldNOTBeNil = @"Should not be \'nil.\'";
NSString * const kPSMTShouldBeNIL    = @"Should not be \'nil.\'";
NSString * const kPSMTNoThrow        = @"Should NOT throw exception";
NSString * const kPSMTShouldThrow    = @"Should throw exception.";

@implementation PSModelTests

#pragma mark -
#pragma mark SET UP and TEAR DOWN

-(void)setUp {
    [super setUp];
    
    NSArray *bundles = [NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]];
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:bundles];
    STAssertNotNil( mom, kPSMTShouldNOTBeNil );
    
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption:@TRUE,
                              NSInferMappingModelAutomaticallyOption:@TRUE
                              };
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType
                                   configuration:nil
                                             URL:nil
                                         options:options
                                           error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    
    self.context = [[NSManagedObjectContext alloc] init];
    self.context.persistentStoreCoordinator = psc;
}

-(void)tearDown { [super tearDown]; }

#pragma mark -
#pragma mark FULL TESTS

-(void)testBuildPSEventBasic {
    PSEvent *event = (PSEvent*)[NSEntityDescription insertNewObjectForEntityForName:kPSEventEnitytName
                                                             inManagedObjectContext:self.context];
    STAssertNotNil( event, kPSMTShouldNOTBeNil );
    
    event.name = @"Test Event";
    event.eventId = @12345;
    event.creationDate = @([[NSDate date] timeIntervalSince1970]);
    event.lastModified = @([[NSDate date] timeIntervalSince1970]);
    
    NSError *error;
    STAssertTrue( [self.context save:&error], error.debugDescription );
}

#pragma mark -
#pragma mark Partial Tests

-(void)testBuildLocation {
    PSLocation *location = (PSLocation*)[NSEntityDescription insertNewObjectForEntityForName:kPSLocationEntityName
                                                                      inManagedObjectContext:self.context];
    STAssertNotNil( location, kPSMTShouldNOTBeNil );
    
    // This is the Flat Iron building NYC
    CGFloat latitude  = 40.7411;
    CGFloat longitude = 73.9897;
    
    STAssertNoThrow( location.latitude = @(latitude), kPSMTNoThrow );
    STAssertNoThrow( location.longitude = @(longitude), kPSMTNoThrow );
    STAssertNoThrow( location.name = @"Flat Iron Building", kPSMTNoThrow );
    
    STAssertNil( location.event, @"Should be \'nil.\'" );
    
    NSManagedObjectID *objectIDOne = location.objectID;
    NSError *error = 0;
    STAssertTrue( [self.context save:&error], error.debugDescription );
    NSManagedObjectID *objectIDTwo = location.objectID;
    STAssertFalse( [objectIDTwo isEqual:objectIDOne], @"Should be equal after saving." );
    
}

-(void)testBuildPSResponseFails {
    PSResponse *response = (PSResponse*)[NSEntityDescription insertNewObjectForEntityForName:kPSResponseEntityName
                                                                      inManagedObjectContext:self.context];
    STAssertNotNil( response, kPSMTShouldNOTBeNil );
    
    STAssertNoThrow( response.comment = @"Some random comment.", kPSMTNoThrow );
    STAssertNoThrow( response.responseId = @666, kPSMTNoThrow );
    STAssertNoThrow( response.creation = @([[NSDate date] timeIntervalSince1970]), kPSMTNoThrow );
    STAssertThrows( response.event = (id)[NSNull null], kPSMTShouldThrow );
    
    NSError *error = 0;
    STAssertFalse( [self.context save:&error], error.debugDescription );
    PSDLog( @"Should not be able to save since \'response.event\' is required:\n%@", error.debugDescription );
}

-(void)testPSImageResponseFails {
    PSEImageResponse *image = (PSEImageResponse*)[NSEntityDescription insertNewObjectForEntityForName:kPSEImageResponseName
                                                                               inManagedObjectContext:self.context];
    STAssertNotNil( image, kPSMTShouldNOTBeNil );
    
    STAssertNoThrow( image.comment = @"Image comment", kPSMTNoThrow );
    STAssertNoThrow( image.responseId = @999, kPSMTNoThrow );
    STAssertNoThrow( image.creation = @([[NSDate date] timeIntervalSince1970]), kPSMTNoThrow );
    STAssertNoThrow( image.path = @"/some/path/to/image.png", kPSMTNoThrow );
    STAssertThrows( image.event = (id)[NSNull null], kPSMTShouldThrow );
    
    NSError *error = 0;
    STAssertFalse( [self.context save:&error], @"Should not be able to save with setting \'event.\'" );
    STAssertNotNil( error, kPSMTShouldNOTBeNil );
}

#pragma mark -
#pragma mark NSKeyValueObserving Methods

@end
