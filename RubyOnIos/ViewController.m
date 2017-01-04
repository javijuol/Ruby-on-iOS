//
//  ViewController.m
//  Ruby on iOS
//
//  Created by Javier Juan on 14/10/16.
//  Copyright © 2016 Javier Juan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ruby.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize console;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[AppDelegate appDelegate] setDelegate: self];
    [console.layoutManager setAllowsNonContiguousLayout:false];
    [console setText: @"Ready to have fun!\n"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
    VALUE script = rb_str_new_cstr("main.rb");
    rb_load(script, 0);
    rb_eval_string("reload");
}

- (void)log:(NSString*) msg {
    [console setText: [NSString stringWithFormat:@"%@\n%@", console.text, msg]];
    [console scrollRangeToVisible: NSMakeRange(console.text.length, 1)];
}

@end
