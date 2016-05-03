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


@end
