//
//  Operation.h
//  EasyCalculator
//
//  Created by jhow on 7/5/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operation : NSObject

+ (NSDecimalNumber *)add:(NSDecimalNumber *)summand
                  withAddend:(NSDecimalNumber *)addend;
+ (NSDecimalNumber *)sub:(NSDecimalNumber *)minend
              withSubtrahend:(NSDecimalNumber *)subtrahend;
+ (NSDecimalNumber *)mult:(NSDecimalNumber *)mulitplicand
               withMultiplier:(NSDecimalNumber *)multiplier;
+ (NSDecimalNumber *)div:(NSDecimalNumber *)dividend
                 withDivisor:(NSDecimalNumber *)divisor;

@end
