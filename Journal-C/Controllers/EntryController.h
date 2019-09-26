//
//  EntryController.h
//  Journal-C
//
//  Created by Lewis Jones on 01/02/2019.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

//Source of truth
@property (nonatomic, strong) NSMutableArray *entries;

//Our shared instance
+(EntryController *)shared;


-(void)addEntry:(Entry *)entry;
-(void)removeEntry:(Entry *)entry;
-(void)saveToPersistentStorage;
-(void)loadFromPersistentStorage;



@end

NS_ASSUME_NONNULL_END
