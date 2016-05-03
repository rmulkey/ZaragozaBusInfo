//
//  BusListCell.h
//  ZaragozaBusInfo
//
//  Created by Mulkey, Rodrigo S. on 5/3/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusListCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *subTitleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *mapImageView;

@end
