//
//  JOFAppDelegateTests.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 01/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//


#import <XCTest/XCTest.h>
//#import <OCMock/OCMock.h>
#import "JOFAppDelegate.h"

@interface FakeMOC : NSManagedObjectContext
@property (assign) BOOL hasSaved;

@end

@implementation FakeMOC
//stub solo el hasChanges. Los dos son mock
- (BOOL)hasChanges{
    return NO;
}

- (BOOL) save:(NSError *__autoreleasing *)error{
    self.hasSaved = YES;
    return YES;
}

@end

@interface JOFAppDelegateTests : XCTestCase {
    // Core Data stack objects.
    NSManagedObjectModel *model;
    NSPersistentStoreCoordinator *coordinator;
    NSPersistentStore *store;
    NSManagedObjectContext *context;
    // Object to test.
    JOFAppDelegate *sut;
}

@end


@implementation JOFAppDelegateTests

#pragma mark - Set up and tear down

- (void) setUp {
    [super setUp];

//    [self createCoreDataStack];
    [self createFixture];
    [self createSut];
}


- (void) createCoreDataStack {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    model = [NSManagedObjectModel mergedModelFromBundles:@[bundle]];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    store = [coordinator addPersistentStoreWithType: NSInMemoryStoreType
                                      configuration: nil
                                                URL: nil
                                            options: nil
                                              error: NULL];
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = coordinator;
}


- (void) createFixture {
    // Test data
}


- (void) createSut {
    sut = [[JOFAppDelegate alloc] init];
}


- (void) tearDown {
    [self releaseSut];
    [self releaseFixture];
//    [self releaseCoreDataStack];

    [super tearDown];
}


- (void) releaseSut {
    sut = nil;
}


- (void) releaseFixture {

}


- (void) releaseCoreDataStack {
    context = nil;
    store = nil;
    coordinator = nil;
    model = nil;
}


#pragma mark - Basic test

- (void) testObjectIsNotNil {
    
    XCTAssertNotNil(sut, @"The object to test must be created in setUp.");
}

- (void)testMOCIsNotNil {
    XCTAssertNotNil(sut.managedObjectContext, @"MOC must not be nil.");
}

- (void)testPersistentStoreIsNotNil {
    XCTAssertNotNil(sut.persistentStoreCoordinator, @"Persistent store coordinator must not be nil");
}

- (void)testMOCDoesntSaveWithNoChanges {
    //Prepare
    FakeMOC *fakeMOC = [[FakeMOC alloc] init];
    [sut setValue:fakeMOC forKeyPath:@"managedObjectContext"];
    
    //Operate
    [sut saveContext];
    
    //Check
    XCTAssertFalse(fakeMOC.hasSaved, @"MOC's save must not be called if there are no changes");
}

- (void)testAppDocumentsDirectoryIsNotNil {
    NSURL *documentsDirectory = [sut applicationDocumentsDirectory];
    XCTAssertNotNil(documentsDirectory, @"Application Documents Directory must not be nil");
}

- (void)testAppDocumentsDirectoryIsADirectory {
    NSURL *documentsDirectory = [sut applicationDocumentsDirectory];
    documentsDirectory;
}



@end
