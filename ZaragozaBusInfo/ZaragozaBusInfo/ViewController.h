//
//  ViewController.h
//  ZaragozaBusInfo
//
//  Created by Mulkey, Rodrigo S. on 5/2/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *busListTableView;
@property (strong, nonatomic) NSArray *listOfBuses;


@end

