//
//  @@PROJECTNAME@@Section.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import "@@PROJECTNAME@@Section.h"

@interface @@PROJECTNAME@@Section ()

@property (nonatomic, @@STRONG_PROPERTY@@) NSBundle *bundle;

@end

@implementation @@PROJECTNAME@@Section

- (instancetype)init {
    self = [super init];
    if (self) {
        self.bundle = @@BUNDLE@@;
    }
    return self;
}

- (CGFloat)sectionHeight {
    return 50.0f;
}

- (void)loadView {
    self.view = [[@@PROJECTNAME@@SectionView alloc] init];
}

- (UIView *)view {
    if (!_view) {
        [self loadView];
    }
    
    return _view;
}

- (void)dealloc {
    @@DEALLOC@@
}

@end