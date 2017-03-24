//
//  zhViewController.m
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2016/12/14.
//  Copyright © 2016年 海神. All rights reserved.
//

#import "zhViewController.h"
#import "ZHModelCell.h"
@interface zhViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *tableArray;
    NSMutableArray *cellArray;
    NSMutableDictionary *ModifyDict;
}
@property (nonatomic, strong) NSDictionary *JSONDict;
@property (weak, nonatomic) IBOutlet UITextView *JSTextView;
@property (weak, nonatomic) IBOutlet UIButton *ChangeBtn;
- (IBAction)change:(UIButton *)sender;
- (IBAction)Pass:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *generateBtn;
- (IBAction)generate:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview;



@end
static NSString *info_h;
static NSString *info_m;
@implementation zhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    info_h = @"#import <Foundation/Foundation.h>\n\n";
    info_m = @"";
    self.JSTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.JSTextView.layer.borderWidth = 1;
    self.ChangeBtn.layer.borderWidth = 1;
    self.ChangeBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.generateBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.generateBtn.layer.borderWidth = 1;
    tableArray = [NSMutableArray array];
    cellArray = [NSMutableArray array];
    ModifyDict = [NSMutableDictionary dictionary];
    [tableArray addObject:@"文件名称"];
    [self initWithTableView];
}
- (NSDictionary *)JSONDict{
    NSString *JSONString = self.JSTextView.text;
    NSData *data = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return dict;
}
- (void)initWithTableView{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (cellArray.count > indexPath.row + 1) {
        return cellArray[indexPath.row];
    }else{
        ZHModelCell *cell = [ZHModelCell cellWithTableView:tableView];
        cell.infolabel.text = tableArray[indexPath.row];
        if (indexPath.row == 0) {
            
            cell.infotextfield.placeholder = @"请输入需要生成的文件名称，此名称也会作为当前model的第一个名称";
        }else{
            cell.infotextfield.placeholder = @"如需要改变，请输入需要改变的内容";
        }
        [cellArray addObject:cell];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
// 第一次进入肯定是字典

- (void)ThoughtWithStringName:(NSString *)name Dictionary:(id)code{
    NSLog(@"@interface %@ : NSObject",name);
    info_h = [info_h stringByAppendingString:[NSString stringWithFormat:@"@interface %@ : NSObject\n",name]];
    info_m = [info_m stringByAppendingString:[NSString stringWithFormat:@"@implementation %@\n\n",name]];
    NSMutableDictionary *flag_Dict = [NSMutableDictionary dictionary];
    if ([code isKindOfClass:[NSDictionary class]]) {
        NSString *SEL_String = @"";
        for (NSString *propety in [code allKeys]) {
            //正式生成model的逻辑代码
            NSString *before_Str = @"@property (nonatomic, ";
            NSString *center_Str = @"";
            NSString *last_Str = @"";
            if ([code[propety] isKindOfClass:[NSNumber class]]) {
                center_Str = @"assign) ";
                last_Str = [self judgeBasicType:code[propety]];
            }else if ([code[propety] isKindOfClass:[NSString class]]) {
                center_Str = @"copy) ";
                last_Str = @"NSString *";
            }else {
                center_Str = @"strong) ";
                if ([code[propety] isKindOfClass:[NSDictionary class]]) {
                    //如果是字典，这里就需要一个对象的名称 --内部需要复杂的逻辑处理
                    NSString *objec_name = [ModifyDict[propety] length] > 0 ? ModifyDict[propety] : propety;
                    last_Str = [NSString stringWithFormat:@"%@ *",objec_name];
                    info_h = [[NSString stringWithFormat:@"@class %@;\n",objec_name] stringByAppendingString:info_h];
                    if ([ModifyDict[propety] length] > 0) {
//                        info_m = [info_m stringByAppendingString:[NSString stringWithFormat:@""]];
                        if (SEL_String.length == 0) {
                            SEL_String = [SEL_String stringByAppendingString:[NSString stringWithFormat:@"@\"%@\" : [%@ class]",propety,ModifyDict[propety]]];
                        }else{
                            SEL_String = [SEL_String stringByAppendingString:[NSString stringWithFormat:@",@\"%@\" : [%@ class]",propety,ModifyDict[propety]]];
                        }
                    }
                    [tableArray addObject:propety];
                    [flag_Dict setObject:code[propety] forKey:propety];
//                    [flag_Dict addObject:code[propety]];
                }else if ([code[propety] isKindOfClass:[NSArray class]]) {
                    //如果输数组 这里需要一个泛型
                    NSString *objec_name = [ModifyDict[propety] length] > 0 ? ModifyDict[propety] : propety;
                    if ([ModifyDict[propety] length] > 0) {
                        //                        info_m = [info_m stringByAppendingString:[NSString stringWithFormat:@""]];
                        if (SEL_String.length == 0) {
                            SEL_String = [SEL_String stringByAppendingString:[NSString stringWithFormat:@"@\"%@\" : [%@ class]",propety,ModifyDict[propety]]];
                        }else{
                            SEL_String = [SEL_String stringByAppendingString:[NSString stringWithFormat:@",@\"%@\" : [%@ class]",propety,ModifyDict[propety]]];
                        }
                    }
                    if ([code[propety] count] > 0) {
                        last_Str = [NSString stringWithFormat:@"NSArray <%@ *> *",objec_name];
                        info_h = [[NSString stringWithFormat:@"@class %@;\n",objec_name] stringByAppendingString:info_h];
                        [tableArray addObject:propety];
                        [flag_Dict setObject:[code[propety] firstObject] forKey:propety];
                    }else{
                        last_Str = @"NSArray/**因为当前数组返回空，需要自行判断数组内的model*/ *";
                    }
//                    [flag_Dict addObject:[code[propety] firstObject]];
                }else if ([code[propety] isKindOfClass:[NSNull class]]){
                    center_Str = @"strong) ";
                    last_Str = @"需要自行确认类型 *";
                }else{
                    NSLog(@"没有考虑到的情况%@",code[propety]);
                }
            }
            NSString *propetyWhole = [NSString stringWithFormat:@"%@%@%@%@;",before_Str,center_Str,last_Str,propety];
            info_h = [info_h stringByAppendingString:[NSString stringWithFormat:@"\n%@\n",propetyWhole]];
            NSLog(@"%@",propetyWhole);
        }
        if (SEL_String.length != 0) {
            info_m = [[info_m stringByAppendingString:[NSString stringWithFormat:@"+ (NSDictionary *)modelContainerPropertyGenericClass{\n    return @{%@",SEL_String]] stringByAppendingString:@"};\n}\n"];
        }
    }else{
        NSLog(@"无逻辑代码判断");
    }
    info_h = [info_h stringByAppendingString:@"\n@end\n\n"];
    
    info_m = [info_m stringByAppendingString:@"\n@end\n\n"];
    NSLog(@"\n@end\n");
    for (NSString *propety in [flag_Dict allKeys]) {
        NSString *objec_name = [ModifyDict[propety] length] > 0 ? ModifyDict[propety] : propety;
        [self ThoughtWithStringName:objec_name Dictionary:flag_Dict[propety]];
    }
    [self.tableview reloadData];
}




#pragma mark 判断数组内的

/**
 判断数组内的对象是否一致
 
 @param array 需要传入的数组
 @return 返回一个BOOL
 */
- (BOOL)boolArrayClass:(NSArray *)array{
    if (array.count == 0) {
        NSLog(@"类型数组为空，请确认");
        return YES;
    }
    id object = [array firstObject];
    NSArray *properyArr;
    if ([object isKindOfClass:[NSDictionary class]]) {
        properyArr = [object allKeys];
        for (NSDictionary *dictArr in array) {
            if (![[NSSet setWithArray:properyArr] isSubsetOfSet:[NSSet setWithArray:[dictArr allKeys]]]) {
                NSLog(@"model不完全吻合");
                return NO;
            }
        }
    }
    Class class = [object class];
    for (id tt in array) {
        if (![tt isKindOfClass:class]) {
            NSLog(@"%@,%@",NSStringFromClass([tt class]),NSStringFromClass(class));
            return NO;
        }
    }
    return YES;
}

#pragma mark 得知基本类型属于什么类型
- (NSString *)judgeBasicType:(NSNumber *)number{
    const char *ObjectType = [number objCType];
    if (strcmp(ObjectType, @encode(int)) == 0) {
        return @"int ";
    }else if (strcmp(ObjectType, @encode(float)) == 0) {
        
        return @"float ";
    }else if (strcmp(ObjectType, @encode(double)) == 0) {
        return @"double ";
    }else if (strcmp(ObjectType, @encode(BOOL)) == 0) {
        return @"BOOL ";
    }else if ([number isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
        return @"BOOL ";
    }else if (strcmp(ObjectType, @encode(long)) == 0) {
        return @"long ";
    }
    else{
        NSLog(@"逻辑之外，需要检查");
        return @"逻辑之外，需要检查";
    }
}

- (IBAction)change:(UIButton *)sender {
    info_h = @"#import <Foundation/Foundation.h>\n\n";
    NSString *JSONString = self.JSTextView.text;
    NSData *data = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error != nil || [dict allKeys].count == 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"无效的JSON" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }else{
        [tableArray removeAllObjects];
        [cellArray removeAllObjects];
        [tableArray addObject:@"文件名称"];
        //说明成功 开始进行生成model
        [self ThoughtWithStringName:@"model" Dictionary:dict];
    }
}

- (IBAction)Pass:(UIButton *)sender {
    self.JSTextView.text = [[UIPasteboard generalPasteboard] string];
}
#pragma mark 生成文件
- (IBAction)generate:(UIButton *)sender {
    for (ZHModelCell *cell in cellArray) {
        if (cell.infotextfield.text.length > 0) {
            [ModifyDict setObject:cell.infotextfield.text forKey:cell.infolabel.text];
        }
    }
    [tableArray removeAllObjects];
    [cellArray removeAllObjects];
    [tableArray addObject:@"文件名称"];
    info_h = @"#import <Foundation/Foundation.h>\n\n";
    info_m = [NSString stringWithFormat:@"#import \"%@.h\"\n",ModifyDict[@"文件名称"]];
    [self ThoughtWithStringName:ModifyDict[@"文件名称"] Dictionary:self.JSONDict];
    [self createPath:[NSString stringWithFormat:@"%@.h",ModifyDict[@"文件名称"]] WithInfo:info_h];
    [self createPath:[NSString stringWithFormat:@"%@.m",ModifyDict[@"文件名称"]] WithInfo:info_m];
    info_h = @"#import <Foundation/Foundation.h>\n\n";
}
#pragma mark 创建文件
- (BOOL)createPath:(NSString *)name WithInfo:(NSString *)info{
    NSArray *paths = [NSHomeDirectory() componentsSeparatedByString:@"/"];
    NSString *last_name = [[name stringByReplacingOccurrencesOfString:@".h" withString:@""] stringByReplacingOccurrencesOfString:@".m" withString:@""];
    NSString *path = [NSString stringWithFormat:@"/%@/%@/Desktop/海神的model/%@",paths[1],paths[2],last_name];
    NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *fm = [NSFileManager defaultManager];
    [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    return [data writeToFile:[path stringByAppendingPathComponent:name] atomically:YES];
}

@end
