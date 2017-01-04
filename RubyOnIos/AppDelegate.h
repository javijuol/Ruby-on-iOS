//
//  AppDelegate.h
//  Ruby on iOS
//
//  Created by Javier Juan on 14/10/16.
//  Copyright © 2016 Javier Juan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsoleLog.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)appDelegate;
- (IBAction)setDelegate:(id<ConsoleLogDelegate>) delegate;
@property (nonatomic, strong) IBOutlet id<ConsoleLogDelegate> console_delegate;

@end

