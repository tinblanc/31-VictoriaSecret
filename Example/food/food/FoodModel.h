//
//  FoodModel.h
//  food
//
//  Created by Tin Blanc on 4/23/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface FoodModel : NSObject
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* price;
@property(nonatomic, strong) NSString* address;
@property(nonatomic, strong) NSString* time;
@property(nonatomic, strong) UIImage* photo;
@property(nonatomic, strong) UIImage* icon;

-(instancetype) init: (NSString*) name
           withPrice: (NSString*) price
         withAddress: (NSString*) address
            withTime: (NSString*) time
            andPhoto: (NSString*) photo;

@end
