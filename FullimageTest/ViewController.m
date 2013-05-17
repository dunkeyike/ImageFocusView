//
//  ViewController.m
//  FullimageTest
//
//  Created by IKE on 13. 5. 17..
//  Copyright (c) 2013년 Dunkey. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

static CGFloat const kMaxAngle = 0.1;
static CGFloat const kMaxOffset = 20;


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mediaFocusManager = [[ASMediaFocusManager alloc] init];
    self.mediaFocusManager.delegate = self;

	[self.mediaFocusManager installOnView:iv_01];
	[self.mediaFocusManager installOnView:iv_02];
	[self.mediaFocusManager installOnView:iv_03];
	[self.mediaFocusManager installOnView:iv_04];
	// Do any additional setup after loading the view, typically from a nib.
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ASMediaFocusDelegate
- (UIImage *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager imageForView:(UIView *)view
{
	selectIvTag = ((UIImageView *)view).tag;
    return ((UIImageView *)view).image;
}

- (CGRect)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager finalFrameforView:(UIView *)view
{
    return self.view.bounds;
}

- (UIViewController *)parentViewControllerForMediaFocusManager:(ASMediaFocusManager *)mediaFocusManager
{
    return self;
}

- (NSURL *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager mediaURLForView:(UIView *)view
{
    NSString *path;
    NSString *name;
    NSInteger index;
    NSURL *url;
    
	index = selectIvTag;

    
    // Here, images are accessed through their name "1f.jpg", "2f.jpg", …
    name = [NSString stringWithFormat:@"%df", index];
    path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];
    
    url = [NSURL fileURLWithPath:path];
    
    return url;
}
@end
