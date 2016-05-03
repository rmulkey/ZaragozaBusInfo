//
//  RequestManager.m
//  ZaragozaBusInfo
//
//  Created by Mulkey, Rodrigo S. on 5/2/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "RequestManager.h"
#import "Constants.h"

@implementation RequestManager

#pragma mark - initWithCallback:
- (id)initWithCallback:(ApiConnectorCallback)block {
    if (self = [super init])
        self.callbackBlock = block;
    
    return self;
}

- (void)fetchBusRoutes {
    
    NSURL *requestURL = [NSURL URLWithString:BUS_API_GET_URL];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask =
    [urlSession dataTaskWithRequest:request
                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                      
                      if ((data) && (data.length > 0)) {
                          NSError *jsonError = nil;
                          NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:NSJSONReadingMutableLeaves
                                                                                       error:&jsonError];
                          
                          if (!jsonObject) {
                              NSLog(@"Parsing JSON error: %@", jsonError);
                              self.callbackBlock(jsonError);
                          } else {
                              self.callbackBlock([jsonObject objectForKey:@"locations"]);
                          }
                      }
                  }];
    
    [dataTask resume];
}


@end
