//
//  DataManager.m
//  food
//
//  Created by Tin Blanc on 4/23/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "DataManager.h"
#import "FoodModel.h"

@implementation DataManager

+(instancetype) getSingleTon {
    static DataManager* dataManager = nil;
    static dispatch_once_t dispatchOnce;
    
    dispatch_once(&dispatchOnce, ^{
        dataManager = [self new];
        
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Food" ofType:@"plist"];
        
        NSArray* raw = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray* temp = [[NSMutableArray alloc] initWithCapacity:raw.count];
        
        for (NSDictionary* item in raw) {
            FoodModel* model = [[FoodModel alloc] init:[item valueForKey:@"name"]
                                             withPrice:[item valueForKey:@"price"]
                                           withAddress:[item valueForKey:@"address"]
                                              withTime:[item valueForKey:@"time"]
                                              andPhoto:[item valueForKey:@"photo"]];
            [temp addObject:model];
            
            dataManager.data = [NSArray arrayWithArray:temp];
            
        }
        
    });
    
    return dataManager;
}

@end
