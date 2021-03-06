/********* zennotification.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface zennotification : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation zennotification

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
 
        [ZDKZendesk initializeWithAppId:"appId" clientId:"clientId" zendeskUrl:"url"];
        [ZDKSupport initializeWithZendesk:[ZDKZendesk instance]];

    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
