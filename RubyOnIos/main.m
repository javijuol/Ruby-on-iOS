//
//  main.m
//  Ruby on iOS
//
//  Created by Javier Juan on 14/10/16.
//  Copyright © 2016 Javier Juan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "ruby.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
		static const char RB_LIB_PATH[] = "../3rd-party/ruby/lib/ruby/2.2.0";
        static const char RB_FILES_PATH[] = "../ruby";
        
        u_long len = strlen(__FILE__) - strlen(strrchr(__FILE__, '/')) + 1;
        char dir[1024] = {'\0'}; // clean buffer
        strncpy(dir, __FILE__, len);
        
        char *rb_lib_path;
        rb_lib_path = malloc(sizeof(char) * (strlen(dir) + strlen(RB_LIB_PATH)));
        strcpy(rb_lib_path, dir);
        strcat(rb_lib_path, RB_LIB_PATH);
        
        char *rb_files_path;
        rb_files_path = malloc(sizeof(char) * (strlen(dir) + strlen(RB_FILES_PATH)));
        strcpy(rb_files_path, dir);
        strcat(rb_files_path, RB_FILES_PATH);
        
        char *rb_env_paths;
        rb_env_paths = malloc(sizeof(char) * (strlen(rb_lib_path) + 1 + strlen(rb_files_path)));
        strcat(rb_env_paths, rb_lib_path);
        strcat(rb_env_paths, ":");
        strcat(rb_env_paths, rb_files_path);
        setenv("RUBYLIB", rb_env_paths, 0);
    
        int argc = 0;
        char **argv;
        ruby_sysinit(&argc, &argv);
        RUBY_INIT_STACK;
        ruby_init();
        ruby_init_loadpath();
        
        VALUE script = rb_str_new_cstr("main.rb");
        rb_load(script, 0);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
