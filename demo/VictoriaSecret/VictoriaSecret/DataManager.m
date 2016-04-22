//
//  DataManager.m
//  VictoriaSecret
//
//  Created by Tin Blanc on 4/19/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "DataManager.h"
#import "VSModel.h"

@implementation DataManager

+ (instancetype) getSingleton {
    static DataManager* dataManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^ { // chỉ chạy duy nhất 1 lần, bất kể bao nhiêu lần gọi
        
        dataManager = [self new];
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"VictoriaSecret" ofType:@"plist"];
        NSArray* raw = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray* temp = [[NSMutableArray alloc] initWithCapacity:raw.count];
        
        for (NSDictionary* item in raw) {
            VSModel* model = [[VSModel alloc] init:[item valueForKey:@"name"]
                                       withMeasure:[item valueForKey:@"measure"]
                                          andPhoto:[item valueForKey:@"photo"]];
            [temp addObject:model];
        }
        
        dataManager.data = [NSArray arrayWithArray:temp];
        
    });
    
    return dataManager;
}

@end
