//
//  ZHModelCell.h
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2016/12/14.
//  Copyright © 2016年 海神. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHModelCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableview;
@property (weak, nonatomic) IBOutlet UILabel *infolabel;
@property (weak, nonatomic) IBOutlet UITextField *infotextfield;

@end
