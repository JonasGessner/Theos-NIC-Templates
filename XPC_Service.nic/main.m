//
//  main.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "xpc/xpc.h"

//Only use NSLog for debugging! Please please remove your NSLogs for public releases (Too many people don't do that :/)




//Client code:
/*
 // Create connection to mach service
 xpc_connection_t connection = xpc_connection_create_mach_service("@@PACKAGENAME@@", NULL, 0);
 xpc_connection_set_event_handler(connection, ^(xpc_object_t some_object) { });
 xpc_connection_resume(connection);
 
 xpc_object_t object = xpc_dictionary_create(NULL, NULL, 0);
 xpc_dictionary_set_string(object, "message", "Ping");
 NSLog(@"Sending object: %s\n", xpc_copy_description(object));
 
 xpc_object_t reply = xpc_connection_send_message_with_reply_sync(connection, object);
 NSLog(@"Received reply object: %s\n\n", xpc_copy_description(reply));
 
 return 0;
 */

int main(int argc, char **argv, char **envp) {
    @autoreleasepool {
        // Attempt to create the server, exit if fails
        xpc_connection_t connection = xpc_connection_create_mach_service("@@PACKAGENAME@@", NULL, XPC_CONNECTION_MACH_SERVICE_LISTENER);
        
        if (!connection) {
            NSLog(@"Failed to create XPC server. Exiting.");
            return 0;
        }
        
        // Configure event handler
        xpc_connection_set_event_handler(connection, ^(xpc_object_t object) {
            xpc_type_t type = xpc_get_type(object);
            
            if (type == XPC_TYPE_CONNECTION) {
                NSLog(@"XPC server received incoming connection: %s", xpc_copy_description(object));
                
                /**
                 * This handler is simply a stub
                 *
                 * The connection should instead be passed to a controller object where
                 * the controller can set it's own event handler and then resume the connection
                 **/
                
                xpc_connection_set_event_handler(object, ^(xpc_object_t some_object) {
                    NSLog(@"XPC connection received object: %s", xpc_copy_description(some_object));
                    xpc_object_t reply = xpc_dictionary_create_reply(some_object);
                    
                    if (reply) {
                        xpc_dictionary_set_string(reply, "message", "Pong");
                        NSLog(@"XPC connection sending reply: %s", xpc_copy_description(reply));
                        xpc_connection_send_message(xpc_dictionary_get_remote_connection(some_object), reply);
                    }
                });
                
                xpc_connection_resume(object);
            }
            else if (type == XPC_TYPE_ERROR) {
                NSLog(@"XPC server error: %s", xpc_dictionary_get_string(object, XPC_ERROR_KEY_DESCRIPTION));
            }
            else {
                NSLog(@"XPC server received unknown object: %s", xpc_copy_description(object));
            }
        });
        
        // Make connection live
        xpc_connection_resume(connection);
        
        // Execute run loop
        [[NSRunLoop currentRunLoop] run];
    }
    
    return 0;
}
