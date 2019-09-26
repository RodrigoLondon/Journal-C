//
//  EntryController.m
//  Journal-C
//
//  Created by Lewis Jones on 01/02/2019.
//  Copyright © 2019 Rodrigo. All rights reserved.
//


#import "EntryController.h"
#import "Entry.h"

static NSString * const EntriesKey = @"entries";

@interface EntryController ()

@end

@implementation EntryController

+ (EntryController *)shared {
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        shared = [EntryController new];
    });
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _entries = [NSMutableArray array];
    }
    return self;
}

-(void)addEntry:(Entry *)entry
{
    [_entries addObject:entry];
    [self saveToPersistentStorage];
    
}

-(void)removeEntry:(Entry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStorage];
}

-(void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];

    }
}

-(void)loadFromPersistentStorage
{

    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [self addEntry: entry];
    }
}

@end



