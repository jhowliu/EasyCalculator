//
//  ViewController.m
//  EasyCalculator
//
//  Created by jhow on 7/3/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import "ViewController.h"
#import "Operation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    result = [NSMutableString stringWithFormat:@"0"];
    
    leftOperator = [NSDecimalNumber alloc];
   
    needDeleteInput = NO;
    isDecimal = NO;
    isFirst = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performOperation:(ButtonType)theOperation
{
    NSDecimalNumber *ans;
    
    switch (theOperation) {
        case ButtonAdd:
            ans = [Operation add:leftOperator
                      withAddend:[NSDecimalNumber decimalNumberWithString:self.resultText.text]];
            break;
        case ButtonMinus:
            ans = [Operation sub:leftOperator
                      withSubtrahend:[NSDecimalNumber decimalNumberWithString:self.resultText.text]];
            break;
        case ButtonMultiply:
            ans = [Operation mult:leftOperator
                      withMultiplier:[NSDecimalNumber decimalNumberWithString:self.resultText.text]];
            break;
        case ButtonDivide:
            ans = [Operation div:leftOperator
                      withDivisor:[NSDecimalNumber decimalNumberWithString:self.resultText.text]];
            if (!ans) return;
            break;
        default:
            break;
    }
    
    NSLog(@"%@",[ans stringValue]);
    [result setString:[ans stringValue]];
}

#define ADD_DIGIT(x) [result appendFormat:@"%d", x]

#define IS_NUMBER(x) (x == ButtonOne || x == ButtonTwo || x == ButtonThree || \
                     x == ButtonFour || x == ButtonFive || x == ButtonSix || \
                     x == ButtonSeven || x == ButtonEight || x == ButtonNine || \
                     x == ButtonZero) ? YES : NO


- (IBAction)touchBtn:(id)sender
{
    NSString *buttonTitle = [(UIButton *)sender currentTitle];
    
    if (needDeleteInput && IS_NUMBER([sender tag])) {
        leftOperator = [NSDecimalNumber decimalNumberWithString:self.resultText.text];
        needDeleteInput = NO;
        isFirst = YES;
    }
    
    if (isFirst && IS_NUMBER([sender tag])) {
        [result setString:@""];
        isFirst = NO;
    }
    
    switch ([sender tag]) {
        case ButtonAC:
            [result setString:@"0"];
            needDeleteInput = NO;
            isDecimal = NO;
            isFirst = YES;
            opt = nil;
            break;
        case ButtonOne:
            ADD_DIGIT(1);
            break;
        case ButtonTwo:
            ADD_DIGIT(2);
            break;
        case ButtonThree:
            ADD_DIGIT(3);
            break;
        case ButtonFour:
            ADD_DIGIT(4);
            break;
        case ButtonFive:
            ADD_DIGIT(5);
            break;
        case ButtonSix:
            ADD_DIGIT(6);
            break;
        case ButtonSeven:
            ADD_DIGIT(7);
            break;
        case ButtonEight:
            ADD_DIGIT(8);
            break;
        case ButtonNine:
            ADD_DIGIT(9);
            break;
        case ButtonZero:
            if ([self.resultText.text intValue] != 0) ADD_DIGIT(0);
            break;
        case ButtonDot:
            if (!isDecimal) {
                isDecimal = YES;
                [result appendFormat:@"."];
            }
            break;
        case ButtonAdd:
            self.sign.text = buttonTitle;
            opt = ButtonAdd;
            needDeleteInput = YES;
            break;
        case ButtonMinus:
            self.sign.text = buttonTitle;
            opt = ButtonMinus;
            needDeleteInput = YES;
            break;
        case ButtonDivide:
            self.sign.text = buttonTitle;
            opt = ButtonDivide;
            needDeleteInput = YES;
            break;
        case ButtonMultiply:
            self.sign.text = buttonTitle;
            opt = ButtonMultiply;
            needDeleteInput = YES;
            break;
        case ButtonEqual:
            if (opt) {
                [self performOperation:opt];
                isFirst = YES;
            }
            break;
        default:
            break;
    }
    
    self.resultText.text = result;
}

@end
