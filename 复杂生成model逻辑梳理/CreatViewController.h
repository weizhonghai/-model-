//
//  CreatViewController.h
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2017/4/14.
//  Copyright © 2017年 海神. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatViewController : UIViewController

/**
 所有可能被选择成为cell的类
 */
@property (nonatomic, strong) NSArray *CreatCellClass;

/**
 写入文件路径
 */
@property (nonatomic, copy) NSString *path;
@end
