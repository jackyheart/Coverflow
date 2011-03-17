//
//  CoverFlowAppDelegate.h
//  CoverFlow
//
//  Created by Jacky on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoverFlowViewController;

@interface CoverFlowAppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CoverFlowViewController *viewController;

@end
