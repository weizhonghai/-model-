//
//  CreatViewController.m
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2017/4/14.
//  Copyright © 2017年 海神. All rights reserved.
//
//  首先这个界面可以创建一个cell类
//  其次需要创建对应的xib类
//  需要在cell中创建多个控件
//  需要可以在cell中重写model的setter方法
//  h文件需要一个可以从控制器初始化的方法
//  m文件实现上面的方法
//  是否需要代理回调    --考虑中
//  需要考虑cell类名称微调问题   --- 判断是否需要更改名称
//  放弃考虑model中还含有字典可能，如果以后需要在完善
//

#import "CreatViewController.h"
//#import <StoreKit/SKStoreReviewController.h>

@interface CreatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSString *CreatClassName;
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)CreatViewBtn:(UIButton *)sender;



@end
static NSString *info_h;
static NSString *info_m;
static NSString *info_xib;
@implementation CreatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TextField.placeholder = self.CreatCellClass[0][@"ModelName"];
    NSLog(@"%@\n%@\n%@",self.CreatCellClass,self.path,self.TotalName);
}
#pragma mark 创建视图层h文件
- (void)CreatView_h{
    //    首先这个文件需要一个创建的时间
    //    然后是导入文件
    //    然后是class
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    self.CreatClassName = [self.CreatClassName stringByAppendingString:@"Cell"];
    info_h = [NSString stringWithFormat:@"//  %@.h\n",self.CreatClassName];
    info_h = [info_h stringByAppendingFormat:@"//  %@\n",nowtimeStr];
    info_h = [info_h stringByAppendingString:@"//\n"];
    info_h = [info_h stringByAppendingString:@"\n#import <UIKit/UIKit.h>\n"];
    info_h = [info_h stringByAppendingFormat:@"\n@class %@;\n",self.TextField.placeholder];
    info_h = [info_h stringByAppendingFormat:@"\n@interface %@ : UITableViewCell\n",self.CreatClassName];
    info_h = [info_h stringByAppendingString:@"\n+ (instancetype)cellWithTableView:(UITableView *)tableview;\n"];
    info_h = [info_h stringByAppendingFormat:@"\n@property (nonatomic, strong) %@ *model;\n",self.TextField.placeholder];
    info_h = [info_h stringByAppendingFormat:@"\n@end\n"];
    
    NSData *data_h = [info_h dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = [self.path stringByAppendingString:@"/View"];
    [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    [data_h writeToFile:[path stringByAppendingFormat:@"/%@.h",self.CreatClassName] atomically:YES];
}

- (void)CreatView_m{
    //    首先这个文件需要一个创建的时间
    //    然后是导入文件
    //    然后是class
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    info_m = [NSString stringWithFormat:@"//  %@.m\n",self.CreatClassName];
    info_m = [info_m stringByAppendingFormat:@"//  %@\n",nowtimeStr];
    info_m = [info_m stringByAppendingString:@"//\n\n"];
    info_m = [info_m stringByAppendingFormat:@"#import \"%@.h\"\n",self.CreatClassName];
    info_m = [info_m stringByAppendingFormat:@"#import \"%@.h\"\n",self.TotalName];
    info_m = [info_m stringByAppendingFormat:@"@interface %@ ()\n\n",self.CreatClassName];
    //动态创建属性
    for (NSDictionary *dic in self.CreatCellClass) {
        if ([dic[@"ModelName"] isEqualToString:self.TextField.placeholder]) {
            for (NSString *property_name in dic[@"InfoName"]) {
                info_m = [info_m stringByAppendingFormat:@"/**\n<#注释#>\n*/"];
                info_m = [info_m stringByAppendingFormat:@"\n@property (nonatomic , weak) IBOutlet <#需要自己设置控件类型#> * %@;\n\n",property_name];
            }
        }
    }
    
    
    info_m = [info_m stringByAppendingFormat:@"\n@end\n"];
    info_m = [info_m stringByAppendingFormat:@"\n@implementation %@\n\n",self.CreatClassName];
    info_m = [info_m stringByAppendingFormat:@"- (void)awakeFromNib {\n    [super awakeFromNib];\n\n}\n\n+ (instancetype)cellWithTableView:(UITableView *)tableview{\n    static NSString *id1 = @\"row\";\n    %@Cell *cell = [tableview dequeueReusableCellWithIdentifier:id1];\n    if (!cell) {\n        cell = [[[NSBundle mainBundle] loadNibNamed:@\"%@Cell\" owner:self options:nil] firstObject];\n    }\n    cell.selectionStyle = UITableViewCellSelectionStyleNone;\n    return cell;\n}\n\n- (void)setSelected:(BOOL)selected animated:(BOOL)animated {\n    [super setSelected:selected animated:animated];\n    \n}\n",self.CreatClassName,self.CreatClassName];
    info_m = [info_m stringByAppendingFormat:@"\n- (void)setModel:(%@ *)model{\n    _model = model;\n\n",self.CreatClassName];
    

    for (NSDictionary *dic in self.CreatCellClass) {
        if ([dic[@"ModelName"] isEqualToString:self.TextField.placeholder]) {
            for (NSString *property_name in dic[@"InfoName"]) {
                info_m = [info_m stringByAppendingFormat:@"    self.%@;\n\n",property_name];
            }
        }
    }
    
    info_m = [info_m stringByAppendingString:@"    \n}\n"];
    info_m = [info_m stringByAppendingString:@"\n@end\n\n"];
    NSData *data_m = [info_m dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = [self.path stringByAppendingString:@"/View"];
    [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    [data_m writeToFile:[path stringByAppendingFormat:@"/%@.m",self.CreatClassName] atomically:YES];
}

#pragma mark 创建xib文件
- (void)CreatView_xib{
    NSError *error;
    NSString *string_xib = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CreateCell" ofType:@"json"] encoding:NSUTF8StringEncoding error:&error];
    NSData *data_xib = [string_xib dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = [self.path stringByAppendingString:@"/View"];
    [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    [data_xib writeToFile:[path stringByAppendingFormat:@"/%@.xib",self.CreatClassName] atomically:YES];
}

- (IBAction)CreatViewBtn:(UIButton *)sender {
    if (self.TextField.text.length == 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"更改名称不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
        return;
    }
    self.CreatClassName = self.TextField.text;
    [self CreatView_h];
    [self CreatView_m];
    [self CreatView_xib];
    NSLog(@"%@\n%@\n%@",info_h,info_m,info_xib);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.CreatCellClass.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *id1 = @"row";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id1];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id1];
    }
    cell.textLabel.text = self.CreatCellClass[indexPath.row][@"ModelName"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.TextField.placeholder = self.CreatCellClass[indexPath.row][@"ModelName"];
}

@end
