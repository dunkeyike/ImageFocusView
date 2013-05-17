//
//  ViewController.h
//  FullimageTest
//
//  Created by IKE on 13. 5. 17..
//  Copyright (c) 2013년 Dunkey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASMediaFocusManager.h"

@interface ViewController : UIViewController <ASMediasFocusDelegate> {
	IBOutlet UIImageView	*iv_01;
	IBOutlet UIImageView	*iv_02;
	IBOutlet UIImageView	*iv_03;
	IBOutlet UIImageView	*iv_04;
	NSInteger	selectIvTag;
}

@property (nonatomic, strong) ASMediaFocusManager *mediaFocusManager;
@end
