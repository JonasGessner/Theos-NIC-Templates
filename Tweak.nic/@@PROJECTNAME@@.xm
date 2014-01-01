//
//  @@PROJECTNAME@@.xm
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <substrate.h>

%group main

%end


%ctor {
	@autoreleasepool {
		%init(main);
	}
}
