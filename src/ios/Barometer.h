//
// Barometer.h
// Written by Nic Mulvaney. 2014.
//


#ifndef weatherless_Barometer_h
#define weatherless_Barometer_h

#import <Cordova/CDVPlugin.h>
#import <CoreMotion/CoreMotion.h>

@interface Barometer : CDVPlugin

@property (nonatomic, strong) CMAltimeter *altimeterManager;
- (void)isAvailable:(CDVInvokedUrlCommand*)command;
- (void)startUpdates:(CDVInvokedUrlCommand*)command;
- (void)stopUpdates:(CDVInvokedUrlCommand*)command;

@end

#endif
