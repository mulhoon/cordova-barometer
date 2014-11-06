/*
 
 Written by Nic Mulvaney. 2014.
 
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 
 */


#import "Barometer.h"
#import <Cordova/CDV.h>
#import <CoreMotion/CoreMotion.h>


@implementation Barometer


- (void)isAvailable:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:[CMAltimeter isRelativeAltitudeAvailable]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)startUpdates:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* pluginResult = nil;
    BOOL isReady = [CMAltimeter isRelativeAltitudeAvailable];
    if( !isReady ) {
        NSLog(@"[Barometer] No altitude available");
        return;
    }
    
    self.altimeterManager = [[CMAltimeter alloc] init];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [self.altimeterManager startRelativeAltitudeUpdatesToQueue:queue withHandler:^(CMAltitudeData *altitudeData, NSError *error) {
        NSDictionary* data = @{
                               @"relativeAltitude": [NSNumber numberWithDouble: altitudeData.relativeAltitude.floatValue],
                               @"pressure":[NSNumber numberWithDouble: altitudeData.pressure.floatValue]
                               };
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:data];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
    
}


- (void)stopUpdates:(CDVInvokedUrlCommand*)command
{
    [self.altimeterManager stopRelativeAltitudeUpdates];
}

@end
