//
//  ViewController.m
//  ZaragozaBusInfo
//
//  Created by Mulkey, Rodrigo S. on 5/2/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "ViewController.h"
#import "BusListCell.h"
#import "RequestManager.h"


@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self fetchData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listOfBuses count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create and reuse cell
    
    static NSString *CellIdentifier = @"busListCell";
    
    BusListCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[BusListCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    //Populating cell
    
    NSDictionary *busValues = self.listOfBuses[indexPath.row];
    
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", busValues[@"title"]];
    cell.subTitleLabel.text = [NSString stringWithFormat:@"%@", busValues[@"subtitle"]];

    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0f;
}

// Adding a tableView Header

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, self.busListTableView.bounds.size.width, 20)];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [label.font fontWithSize:15];
    label.text = @"List of Buses in Zaragoza";
    label.textAlignment = NSTextAlignmentCenter;
        
    UIView *sectionHeader = [[UIView alloc] init];
    sectionHeader.backgroundColor = [UIColor lightGrayColor];
    [sectionHeader addSubview:label];
        
    return sectionHeader;
    
}

- (void) fetchData {
    
    RequestManager *request = [RequestManager alloc];
    [request fetchBusRoutes];
    
//    RequestManager *requestManager = [[RequestManager alloc] initWithCallback:^(id responseObject) {
//        if ([responseObject isKindOfClass:[NSArray class]]) {
//            if ([responseObject count] > 0) {
//                
//                NSMutableArray *busSortValues = [NSMutableArray arrayWithArray:responseObject];
//                [busSortValues sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES]]];
//                
//                self.listOfBuses = busSortValues;
//                
//                NSLog(@"List: %@", self.listOfBuses);
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.busListTableView reloadData];
//                });
//            }
//        } else {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error Fetching the Buses"
//                                                                                         message:responseObject
//                                                                                  preferredStyle:UIAlertControllerStyleAlert];
//                
//                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                                      handler:^(UIAlertAction *action) {}];
//                
//                [alertController addAction:defaultAction];
//                
//                [self presentViewController:alertController animated:YES completion:nil];
//                
//            });
//        }
//    }];
//    
//    [requestManager fetchBusRoutes];
}


@end
