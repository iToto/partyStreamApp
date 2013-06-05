//
//  PSLogging.h
//  partyStreamApp
//
//  Created by Mike De Wolfe on 2013-06-04.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

/*
    Defines a set of loggin functions. The best practice is to onlcude this file in the target's pre-compiled
    header file (.pch). This will make macros available to any builds using that header.
 
    NOTE: If this file is uncluded in the .pch file, any changes will require a complete clean of the
          target(s) and a complete re-build.
 */

#ifndef partyStreamApp_PSLogging_h
#define partyStreamApp_PSLogging_h

/*
    Adds a simple debug logging function, which will print out the class name, method, line number, and
    the format passed in. 'DEBUG=1' must be set either in the build settings. Usage example:
        - PSDLog( @"hello, world");
        - PSDLog( "The number is is: %d", 5 );
 
    In a release build (where 'DEBUG' is NOT defined), an empty block takes the place of the function
    call.
 */
#ifdef DEBUG
#define PSDLog(fmt, ...) NSLog((@"[%@ %@] (%d): " fmt), self.class, NSStringFromSelector(_cmd), __LINE__, ##__VA_ARGS__)
#else
#define PSDLog(fmt, ...) {}
#endif

#endif
