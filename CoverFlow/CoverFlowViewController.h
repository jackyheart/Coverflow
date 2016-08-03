//
//  CoverFlowViewController.h
//  CoverFlow
//
//  Created by Jacky on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>

@interface CoverFlowViewController : UIViewController
<TKCoverflowViewDelegate, TKCoverflowViewDataSource> {

    TKCoverflowView *coverflow;
    NSArray *coverArray;
}

@property (nonatomic, retain) TKCoverflowView *coverflow;
@property (nonatomic, retain) NSArray *coverArray;

@end
