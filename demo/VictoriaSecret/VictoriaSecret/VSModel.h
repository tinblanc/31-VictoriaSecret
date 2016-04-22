//
//  VSModel.h
//  VictoriaSecret
//
//  Created by Tin Blanc on 4/19/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface VSModel : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* measure;
@property (nonatomic, strong) UIImage* photo;
@property (nonatomic, strong) UIImage* icon;

-(instancetype) init: (NSString*) name
         withMeasure: (NSString*) measure
            andPhoto: (NSString*) photo;

@end
