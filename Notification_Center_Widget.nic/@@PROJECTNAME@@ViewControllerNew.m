//
//  @@PROJECTNAME@@ViewControllerNew.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import "@@PROJECTNAME@@ViewControllerNew.h"
#import "@@PROJECTNAME@@View.h"

#define selfView ((@@PROJECTNAME@@View *)self.view)

@interface @@PROJECTNAME@@ViewControllerNew ()

@property (nonatomic, @@STRONG_PROPERTY@@) NSBundle *bundle;

@end


@implementation @@PROJECTNAME@@ViewControllerNew

- (instancetype)init {
    self = [super init];
    
	if (self) {
        self.bundle = @@BUNDLE_LOADER@@;
	}
	return self;
}

- (void)loadView {
    self.view = [[@@PROJECTNAME@@View alloc] initWithFrame:(CGRect){CGPointZero, self.preferredViewSize}];
}

- (CGSize)preferredViewSize {
	return CGSizeMake(320.0f, 70.0f);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}
@@DEALLOC@@

- (void)hostDidDismiss {
    [super hostDidDismiss];
	//Notification Center was closed
}

- (void)hostDidPresent {
	[super hostDidPresent];
	//Notification Center was opened
}

@end
