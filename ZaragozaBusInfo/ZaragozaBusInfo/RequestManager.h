//
//  RequestManager.h
//  ZaragozaBusInfo
//
//  Created by Mulkey, Rodrigo S. on 5/2/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ApiConnectorCallback)(id);

@interface RequestManager : NSObject

@property (nonatomic, copy) ApiConnectorCallback callbackBlock;

- (id)initWithCallback:(ApiConnectorCallback)block;
- (void)fetchBusRoutes;



@end
