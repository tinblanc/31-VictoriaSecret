//
//  VSModel.m
//  VictoriaSecret
//
//  Created by Tin Blanc on 4/19/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "VSModel.h"

@implementation VSModel

-(instancetype) init: (NSString*) name
         withMeasure: (NSString*) measure
            andPhoto: (NSString*) photo{
    if (self = [super init]) {
        self.name = name;
        self.measure = measure;
        NSString* photoFile = [NSString stringWithFormat:@"%@.jpg", photo];
        self.photo = [UIImage imageNamed:photoFile];
        
        NSString* iconFile = [NSString stringWithFormat:@"%@0.jpg",photo];
        self.icon = [UIImage imageNamed:iconFile];
    }
    return self;
}

@end
