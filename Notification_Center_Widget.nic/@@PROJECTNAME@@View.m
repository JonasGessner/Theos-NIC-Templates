//
//  @@PROJECTNAME@@View.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import "@@PROJECTNAME@@View.h"

@interface @@PROJECTNAME@@View () {
    UIImageView *_backgroundImageView;
}

@end

@implementation @@PROJECTNAME@@View

#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 838.00
#endif

#define iOS7 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0)

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    if (backgroundImage) {
        if (!_backgroundImageView) {
            _backgroundImageView = [[UIImageView alloc] init];
            [self addSubview:_backgroundImageView];
        }
        
        _backgroundImageView.image = backgroundImage;
    }
    else {
        if (_backgroundImageView) {
            [_backgroundImageView removeFromSuperview];
            @@DEALLOC_BG_IMAGE_VIEW@@
            _backgroundImageView = nil;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //layout your additional views
    if (_backgroundImageView) {
        _backgroundImageView.frame = CGRectInset(self.bounds, 2.0f, 0.0f);
    }
}

- (void)loadFullView {
    //load additonal views
}

- (void)dealloc {
    if (_backgroundImageView) {
        @@UNLOAD_VIEW@@
    }
    //unload views
    @@SUPER_DEALLOC@@
}

@end
