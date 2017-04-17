//
//  ViewController.m
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2016/12/10.
//  Copyright © 2016年 海神. All rights reserved.
//

#import "ViewController.h"
#import "zhViewController.h"
@interface ViewController ()


/**
 开始生成model

 @param sender <#sender description#>
 */
- (IBAction)BeginCreat:(UIButton *)sender;

/**
 是否需要归档

 @param sender <#sender description#>
 */
- (IBAction)archive:(UIButton *)sender;

/**
 是否需要扩展类

 @param sender <#sender description#>
 */
- (IBAction)extension:(UIButton *)sender;

/**
 扩展类Btn
 */
@property (weak, nonatomic) IBOutlet UIButton *extensionBtn;

/**
 是否允许model可以归档
 */
@property (weak, nonatomic) IBOutlet UIButton *archiveBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"海神的Model";

}


- (IBAction)BeginCreat:(UIButton *)sender {
    zhViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"zh"];
    vc.archive_bool = self.archiveBtn.selected;
    vc.extension_bool = self.extensionBtn.selected;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)archive:(UIButton *)sender {
    if ([[sender currentTitle] isEqualToString:@"现在（不归档）"]) {
        sender.selected = YES;
        [sender setTitle:@"现在（归档）" forState:UIControlStateNormal];
    }else {
        sender.selected = NO;
        [sender setTitle:@"现在（不归档）" forState:UIControlStateNormal];
    }
}

- (IBAction)extension:(UIButton *)sender {
    if ([[sender currentTitle] isEqualToString:@"现在（不需要归档扩展类）"]) {
        sender.selected = YES;
        [sender setTitle:@"现在（需要归档扩展类）" forState:UIControlStateNormal];
    }else {
        sender.selected = NO;
        [sender setTitle:@"现在（不需要归档扩展类）" forState:UIControlStateNormal];
    }
}

@end
