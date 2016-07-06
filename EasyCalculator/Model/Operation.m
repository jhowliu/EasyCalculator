//
//  Operation.m
//  EasyCalculator
//
//  Created by jhow on 7/5/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import "Operation.h"

@implementation Operation

+ (NSDecimalNumber *)add:(NSDecimalNumber *)summand withAddend:(NSDecimalNumber *)addend
{
    return [summand decimalNumberByAdding:addend];
}

+ (NSDecimalNumber *)sub:(NSDecimalNumber *)minend withSubtrahend:(NSDecimalNumber *)subtrahend
{
    return [minend decimalNumberBySubtracting:subtrahend];
}

+ (NSDecimalNumber *)mult:(NSDecimalNumber *)mulitplicand withMultiplier:(NSDecimalNumber *)multiplier
{
    return [mulitplicand decimalNumberByMultiplyingBy:multiplier];
}

+ (NSDecimalNumber *)div:(NSDecimalNumber *)dividend withDivisor:(NSDecimalNumber *)divisor
{
    return [divisor isEqualToNumber:[NSNumber numberWithInt:0]] ?
                nil : [dividend decimalNumberByDividingBy:divisor];
}

@end
