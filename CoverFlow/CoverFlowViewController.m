//
//  CoverFlowViewController.m
//  CoverFlow
//
//  Created by Jacky on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoverFlowViewController.h"


@implementation CoverFlowViewController
@synthesize coverflow;
@synthesize coverArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [coverflow release];
    [coverArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.coverArray = [NSArray arrayWithObjects:
                  [UIImage imageNamed:@"ipadcover_1.jpg"],
                  [UIImage imageNamed:@"ipadcover_2.jpg"],
                  [UIImage imageNamed:@"ipadcover_3.jpg"],
                  [UIImage imageNamed:@"ipadcover_4.jpg"],
                  [UIImage imageNamed:@"ipadcover_5.jpg"],
                  [UIImage imageNamed:@"ipadcover_6.jpg"],
                  [UIImage imageNamed:@"ipadcover_7.jpg"],
                  [UIImage imageNamed:@"ipadcover_8.jpg"],
                  [UIImage imageNamed:@"ipadcover_9.jpg"], nil];
    
    
    CGRect r = self.view.bounds;
    r.size.height = 400;
    self.coverflow = [[TKCoverflowView alloc] initWithFrame:r];
    self.coverflow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.coverflow.coverflowDelegate = self;
    self.coverflow.dataSource = self;
    [self.view addSubview:coverflow];
    coverflow.coverSpacing = 100;
    coverflow.coverSize = CGSizeMake(300, 300);
    [self.coverflow setNumberOfCovers:[self.coverArray count]];
    
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self.coverflow bringCoverAtIndexToFront:0 animated:YES];
}

- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasBroughtToFront:(int)index
{
    //NSLog(@"cover at index: %d was brought to front", index);
}

- (TKCoverflowCoverView*) coverflowView:(TKCoverflowView*)coverflowView coverAtIndex:(int)index
{
    TKCoverflowCoverView* cover = [coverflowView dequeueReusableCoverView];
    
    if(cover == nil)
    {
        cover = [[[TKCoverflowCoverView alloc] initWithFrame:CGRectMake(0, 0, 300, 600)] autorelease];
        cover.baseline = 200;
    }
    
    cover.image = [self.coverArray objectAtIndex:index%[self.coverArray count]];
    
    return cover;
}

- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasDoubleTapped:(int)index
{
    TKCoverflowCoverView *cover = [coverflowView coverAtIndex:index];
    if(cover == nil)return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cover cache:YES];
    [UIView commitAnimations];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

@end
