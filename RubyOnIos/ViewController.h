//
//  ViewController.h
//  Ruby on iOS
//
//  Created by Javier Juan on 14/10/16.
//  Copyright © 2016 Javier Juan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsoleLog.h"

@interface ViewController : UIViewController <ConsoleLogDelegate>

- (IBAction)clickButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *console;

@end

