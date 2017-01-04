//
//  ConsoleLog.h
//  Ruby on iOS
//
//  Created by Javi on 30/10/16.
//  Copyright © 2016 Javier Juan. All rights reserved.
//

#ifndef ConsoleLog_h
#define ConsoleLog_h

@protocol ConsoleLogDelegate <NSObject>
	- (void)log:(NSString *) msg;
@end

#endif /* ConsoleLog_h */
