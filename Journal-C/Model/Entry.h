//
//  Entry.h
//  Journal-C
//
//  Created by Lewis Jones on 01/02/2019.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bodyText;
@property (nonatomic, copy) NSDate *timestamp;

@property (strong, nonatomic) NSDictionary *dictionaryCopy;

-(instancetype)initWithTitle: (NSString *)title
                    bodyText: (NSString *)bodyText
                   timestamp: (NSDate *)timestamp;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

