//
//  Entry.m
//  Journal-C
//
//  Created by Lewis Jones on 01/02/2019.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

#import "Entry.h"

static NSString * const titleKey = @"title";
static NSString * const bodyTextKey = @"bodyText";
static NSString * const timestampKey = @"timestamp";

@implementation Entry


- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _title = dictionary[titleKey];
        _bodyText = dictionary[bodyTextKey];
        _timestamp = dictionary[timestampKey];
    }
    return self;
}

-(NSDictionary *)dictionaryCopy
{
    return @{
             titleKey: self.title,
             bodyTextKey: self.bodyText,
             timestampKey: self.timestamp
             };
}

@end
