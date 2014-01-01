//
//  @@PROJECTNAME@@.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import "@@PROJECTNAME@@.h"

@implementation @@PROJECTNAME@@ListController

- (id)specifiers {
	if (_specifiers == nil) {
		_specifiers = @@LOADER@@;
	}
    
	return _specifiers;
}

@end
