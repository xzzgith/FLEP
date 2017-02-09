//
//  App.h
//  FLEmptyDataSet
//
//  Created by Felix on 2017/2/6.
//  Copyright © 2017年 FREEDOM. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,AppType) {
    ApplicationTypeUndefined = 0,
    
    ApplicationType500px = 1,
    ApplicationTypeAirbnb,
    ApplicationTypeAppstore
    
};
@interface App : NSObject
@property (nonatomic,copy) NSString *displayName;
@property (nonatomic,copy) NSString *developerName;
@property (nonatomic,copy) NSString *identifier;
@property (nonatomic,copy) NSString *iconName;
@property (nonatomic,assign) AppType type;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
