//
//  @@PROJECTNAME@@ViewController.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#ifndef __LP64__


#import "@@PROJECTNAME@@ViewController.h"
#import "@@PROJECTNAME@@View.h"

#import "TouchFix/TouchFix.h"

@interface @@PROJECTNAME@@ViewController ()

@property (nonatomic, @@STRONG_PROPERTY@@) @@PROJECTNAME@@View *view;
@property (nonatomic, @@STRONG_PROPERTY@@) NSBundle *bundle;

@end


@implementation @@PROJECTNAME@@ViewController

- (instancetype)init {
    self = [super init];
    
	if (self) {
		self.bundle = @@BUNDLE_LOADER@@;
	}
    
    return self;
}

- (void)loadFullView {
	//Add subviews to self.view here!
    [self.view loadFullView];
}

- (@@PROJECTNAME@@View *)view {
    if (!_view) {
        [self loadView];
    }
    
    return _view;
}

- (void)loadView {
    self.view = [[@@PROJECTNAME@@View alloc] initWithFrame:(CGRect){CGPointZero, {0.0f, self.viewHeight}}];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)loadPlaceholderView {
	UIImage *backgroundImage = [UIImage imageWithContentsOfFile:[self.bundle pathForResource:@"Background" ofType:@"png"]];
    
	UIImage *stretchableBackgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:(NSInteger)backgroundImage.size.width/2.0f topCapHeight:(NSInteger)backgroundImage.size.height/2.0f];
    
    [self.view setBackgroundImage:stretchableBackgroundImage];
}
@@DEALLOC@@

- (void)unloadView {
    @@UNLOAD_VIEW_CONTROLLER@@
	//Destroy any additional subviews you added here!
}

- (float)viewHeight {
	return 70.0f;
}

- (void)viewWillAppear {
    
}

- (void)viewDidAppear {
    
}

- (void)viewWillDisappear {
    
}

- (void)viewDidDisappear {
    
}

#pragma mark - TouchFix

- (NSURL *)launchURLForTapLocation:(CGPoint)point {
    UITouch *touch = [[UITouch alloc] initWithPoint:[self.view convertPoint:point toView:self.view.window] andView:self.view];
    UIEvent *eventDown = [[UIEvent alloc] initWithTouch:touch];
    [touch.view touchesBegan:[eventDown allTouches] withEvent:eventDown];
    [touch setPhase:UITouchPhaseEnded];
    
    UIEvent *eventUp = [[UIEvent alloc] initWithTouch:touch];
    [touch.view touchesEnded:[eventUp allTouches] withEvent:eventUp];
    
    @@TOUCH_FIX_CLEANUP@@
    
    return nil;
}

@end


#endif
