//
//  ViewController.h
//  EasyCalculator
//
//  Created by jhow on 7/3/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ButtonMC = 0,
    ButtonMPlus,
    ButtonMMinus,
    ButtonMR,
    
    ButtonAC,
    ButtonChangeSign,
    ButtonDivide,
    ButtonMultiply,
    
    ButtonSeven,
    ButtonEight,
    ButtonNine,
    ButtonMinus,
    
    ButtonFour,
    ButtonFive,
    ButtonSix,
    ButtonAdd,
    
    ButtonOne,
    ButtonTwo,
    ButtonThree,
    ButtonZero,
   
    ButtonDot,
    ButtonEqual
} ButtonType;

@interface ViewController : UIViewController {
    ButtonType opt;
    
    NSMutableString *result;
    NSDecimalNumber *leftOperator;
    
    BOOL needDeleteInput;
    BOOL isDecimal;
    BOOL isFirst;
}

@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (weak, nonatomic) IBOutlet UITextField *sign;

@end

