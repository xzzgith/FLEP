//
//  ViewController.h
//  FLEmptyPage
//
//  Created by Felix on 2017/2/9.
//  Copyright © 2017年 FREEDOM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLEmpty.h"
@interface ViewController : UIViewController

@property (nonatomic,weak) NSArray *apps;
-(id)initWithApp:(App *)app;

@end

