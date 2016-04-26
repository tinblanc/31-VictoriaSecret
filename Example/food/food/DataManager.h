//
//  DataManager.h
//  food
//
//  Created by Tin Blanc on 4/23/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
@property ( nonatomic, strong) NSArray* data;

+( instancetype) getSingleTon;
@end
