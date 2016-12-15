//
//  ZHModelCell.m
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2016/12/14.
//  Copyright © 2016年 海神. All rights reserved.
//

#import "ZHModelCell.h"

@implementation ZHModelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableview{
    static NSString *id1 = @"row";
    ZHModelCell *cell = [tableview dequeueReusableCellWithIdentifier:id1];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZHModelCell" owner:self options:nil] firstObject];
    }
    cell.infotextfield.autocorrectionType = UITextAutocorrectionTypeNo;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self.infotextfield becomeFirstResponder];
    }
    // Configure the view for the selected state
}

@end
