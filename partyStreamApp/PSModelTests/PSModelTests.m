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

@implementation PSModelTests

-(void)setUp {
    [super setUp];
    
    NSArray *bundles = [NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]];
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:bundles];
    STAssertNotNil( mom, @"ManangedObjectModel is \'nil.\'" );
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType
                                   configuration:nil
                                             URL:nil
                                         options:nil
                                           error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    
    self.context = [[NSManagedObjectContext alloc] init];
    self.context.persistentStoreCoordinator = psc;
}

-(void)tearDown { [super tearDown]; }

-(void)testBuildPSEvent {
    PSEvent *event = (PSEvent*)[NSEntityDescription insertNewObjectForEntityForName:kPSEventEnitytName
                                                             inManagedObjectContext:self.context];
    STAssertNotNil( event, @"Event should not be \'nil.\'" );
    
    event.name = @"Test Event";
    event.eventId = @12345;
    event.creationDate = @([[NSDate date] timeIntervalSince1970]);
    
    NSError *error;
    STAssertTrue( [self.context save:&error], @"Could not save." );
    PSDLog( @"Error: %@", error.debugDescription );
    
}

#pragma mark -
#pragma mark Partial Tests

-(void)testBuildLocation {
    PSLocation *location = (PSLocation*)[NSEntityDescription insertNewObjectForEntityForName:kPSLocationEntityName
                                                                      inManagedObjectContext:self.context];
    STAssertNotNil( location, @"SHould not be \'nil.\'" );
    
    // This is the Flat Iron building NYC
    CGFloat latitude  = 40.7411;
    CGFloat longitude = 73.9897;
    
    STAssertNoThrow( location.latitude = @(latitude), @"Should not throw exception." );
    STAssertNoThrow( location.longitude = @(longitude), @"Should not throw an exception here." );
    STAssertNoThrow( location.name = @"Flat Iron Building", @"Should not throw exception." );
    
    STAssertNil( location.event, @"Should be \'nil.\'" );
    
    PSDLog( @"Location:\n%@", location.debugDescription );
    PSDLog( @"Location MOID: %@", location.objectID );
    
    NSError *error = 0;
    STAssertTrue( [self.context save:&error], error.debugDescription );
    PSDLog( @"Location MOID: %@", location.objectID );
}



@end
