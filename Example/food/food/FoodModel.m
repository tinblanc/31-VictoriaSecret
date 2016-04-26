
//
//  FoodModel.m
//  food
//
//  Created by Tin Blanc on 4/23/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel

-(instancetype) init: (NSString*) name
           withPrice: (NSString*) price
         withAddress: (NSString*) address
            withTime: (NSString*) time
            andPhoto: (NSString*) photo{
    if (self = [super init]) {
        self.name = name;
        self.price = price;
        self.address = address;
        self.time = time;
        
        NSString* photoFile = [NSString stringWithFormat:@"%@.jpg", photo];
        self.photo = [UIImage imageNamed:photoFile];
    }
    
    return self;
}

@end
