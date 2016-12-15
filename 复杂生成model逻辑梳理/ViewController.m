//
//  ViewController.m
//  复杂生成model逻辑梳理
//
//  Created by 海神 on 2016/12/10.
//  Copyright © 2016年 海神. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDictionary *infodic;
}
@end
static NSString *h_wenjian;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    h_wenjian = @"";
//    infodic = @{@"Status":@1,@"Result":@[@{@"Pic":@"Public\/Uploads\/2016-07-04\/5779c89066101.jpg",@"Url":@"http:\/\/222.163.24.198\/Advertising\/Index?type=3"},@{@"Pic":@"Public\/Uploads\/2016-12-05\/584575f1ab7c9.jpg",@"Url":@"http:\/\/222.163.24.198\/Advertising\/Index?type=4"},@{@"Pic":@"Public\/Uploads\/2016-12-05\/5845764cce3f0.jpg",@"Url":@"http:\/\/222.163.24.198\/Advertising\/Index?type=1"}]};
    infodic = @{@"Status":@1,@"TotalCount":@"42",@"TotalPages":@5,@"CurrentPage":@"1",@"Result":@[@{@"id":@"66",@"goods_name":@"电风扇",@"img":@"Public\/Uploads\/2016-12-07\/5847acb9d3e4e.jpg",@"good_img":@"",@"good_num":@"0342078121",@"stock":@"86",@"goods_price":@"1500",@"goods_integral":@"5000",@"goods_synopsis":@"你好",@"goods_addtime":@"2016-12-07",@"is_index":@"1",@"is_popular":@"1"},@{@"id":@"65",@"goods_name":@"智享电饼铛ACCK-032",@"img":@"Public\/Uploads\/2016-07-11\/57833d658d883.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143112_61190.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143119_19615.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143119_63684.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143119_26993.jpg,@",@"good_num":@"0230403232",@"stock":@"54",@"goods_price":@"528",@"goods_integral":@"20000",@"goods_synopsis":@"Eupa\/灿坤 精致悬浮式 双面使用ACCK-032智享 电饼铛",@"goods_addtime":@"2016-12-09",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"64",@"goods_name":@"意式咖啡机ZCYLKS-045",@"img":@"Public\/Uploads\/2016-07-11\/57833d0c816f8.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142952_49402.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142952_39248.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142952_64775.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142953_30365.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142953_59954.jpg,@",@"good_num":@"0229165815",@"stock":@"23",@"goods_price":@"688",@"goods_integral":@"30000",@"goods_synopsis":@"正品Electrolux\/伊莱克斯 ZCYLKS-045意式咖啡机 带蒸汽喷嘴咖啡机",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"63",@"goods_name":@"伊莱克斯TRUE-LOVE单杯咖啡机ZCYLKS-030",@"img":@"Public\/Uploads\/2016-07-11\/57833cb8dc55c.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142748_37888.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142748_27589.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142749_86525.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142749_55296.jpg,@",@"good_num":@"0227261546",@"stock":@"55",@"goods_price":@"178",@"goods_integral":@"8000",@"goods_synopsis":@"Electrolux\/伊莱克斯 ZCYLKS-030 单杯咖啡机 滴漏式咖啡壶 迷你家用",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"62",@"goods_name":@"伊莱克斯多功能电火锅ZCYLKS-025",@"img":@"Public\/Uploads\/2016-07-11\/57833c38db58d.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142529_14059.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142529_58872.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142530_94169.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142530_10241.jpg,@",@"good_num":@"0224532086",@"stock":@"36",@"goods_price":@"358",@"goods_integral":@"15500",@"goods_synopsis":@"伊莱克斯多功能电火锅ZCYLKS-025白色1.5L一体电火锅",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"61",@"goods_name":@"伊莱克斯电炖盅ZCYLKS-032",@"img":@"Public\/Uploads\/2016-07-11\/57833bb13a1cc.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142351_23881.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142351_49699.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142352_21972.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142352_12529.jpg,@",@"good_num":@"0223141510",@"stock":@"32",@"goods_price":@"188",@"goods_integral":@"8500",@"goods_synopsis":@"Electrolux\/伊莱克斯 电炖盅儿童电炖锅ZCYLKS-032 母婴陶瓷",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"60",@"goods_name":@"伊莱克斯电炖锅ZCYLKS-028",@"img":@"Public\/Uploads\/2016-07-11\/57833b4e0f603.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142121_88686.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142122_66593.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142122_30354.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142122_71119.jpg,@",@"good_num":@"0220406767",@"stock":@"35",@"goods_price":@"428",@"goods_integral":@"11000",@"goods_synopsis":@"伊莱克斯陶瓷电炖锅ZCYLKS-028电炖盅3L白瓷熬粥煮粥煲汤养生慢炖锅",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"59",@"goods_name":@"伊莱克斯打蛋器ZCYLKS-042",@"img":@"Public\/Uploads\/2016-07-11\/57833ab49b788.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141636_72402.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141638_32206.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141638_98313.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141638_17690.jpg,@",@"good_num":@"0216108625",@"stock":@"70",@"goods_price":@"288",@"goods_integral":@"12000",@"goods_synopsis":@"伊莱克斯打蛋器ZCYLKS-042打蛋、搅拌双功能",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"57",@"goods_name":@"新秀丽时尚休闲包深蓝色SN-125E",@"img":@"Public\/Uploads\/2016-07-11\/5783393aafc13.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141158_65939.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141205_97415.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141205_52324.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141206_60457.jpg,@",@"good_num":@"0211365257",@"stock":@"56",@"goods_price":@"680",@"goods_integral":@"15000",@"goods_synopsis":@"新秀丽SN-125e双肩电脑包",@"goods_addtime":@"2016-07-11",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"56",@"goods_name":@"新秀丽时尚休闲包 橙色SN-123E",@"img":@"Public\/Uploads\/2016-07-11\/578338879f26c.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140818_91007.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140825_96105.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140826_17890.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140826_88815.jpg,@",@"good_num":@"0207509868",@"stock":@"39",@"goods_price":@"680",@"goods_integral":@"15000",@"goods_synopsis":@"新秀丽SN-123e双肩电脑包",@"goods_addtime":@"2016-07-11",@"is_index":@"0",@"is_popular":@"0"}]};
    NSString *json = @"{\"Status\":1,\"Result\":[{\"id\":\"45\",\"title\":\"\u6ce8\u518c\u6709\u597d\u793c\",\"addtime\":\"1480383007\",\"path\":\"Public\/Uploads\/2016-11-29\/583cda1e3fdb1.jpg\"},{\"id\":\"44\",\"title\":\"\u60ca\u559c\u6709\u597d\u793c\",\"addtime\":\"1480382918\",\"path\":\"Public\/Uploads\/2016-11-29\/583cd9c587eb5.jpg\"}]}";
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    infodic = dic;
//    [NSCFBoolean Class];
    
    id value = [NSNumber numberWithFloat:4.4];
    const char *pObjCType = [value objCType];
    NSLog(@"%d",strcmp(pObjCType, @encode(int)));
//    NSLog(@"%@",[self boolArrayClass:@[@{@"c2c":@"bb",@"cc":@"bb",@"cc2":@"bb"},@{@"cc":@"b",@"cc2":@"ss",@"c2c":@"zz"}]]?@"真":@"假");
////    [self visitDict:[NSMutableDictionary dictionaryWithDictionary:infodic]];
//    [self Visit:infodic];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self Visit:infodic];
}
- (void)visitDict:(id)dict{
    h_wenjian = [h_wenjian stringByAppendingString:@"@interface ViewController : NSObject"];
    NSLog(@"分割线");
    if ([dict isKindOfClass:[NSMutableDictionary class]]) {
        NSArray *keys=[dict allKeys];
        for (NSString *key in keys) {
            NSLog(@"%@",key);
            if([[dict objectForKey:key] isKindOfClass:[NSDictionary class]]) {
                NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithDictionary:[dict objectForKey:key]];
                [self visitDict:dic1];
                dict[key] = dic1;
            }else if ([dict[key] isKindOfClass:[NSArray class]]) {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:dict[key]];
                [self visitDict:arr];
                dict[key] = arr;
            }
        }
    }else if ([dict isKindOfClass:[NSMutableArray class]]) {
        if ([self boolArrayClass:dict] && [dict count] > 0) {
            if ([[dict firstObject] isKindOfClass:[NSDictionary class]]) {
                for (NSString *property in [[dict firstObject] allKeys]) {
                    NSLog(@"%@",property);
                }
                return;
            }
        }
        for (int i = 0 ; i < ((NSMutableArray *)dict).count; i++) {
            NSLog(@"%@",((NSMutableArray *)dict)[i]);
            if ([((NSMutableArray *)dict)[i] isKindOfClass:[NSArray class]]) {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:((NSMutableArray *)dict)[i]];
                [self visitDict:arr];
                ((NSMutableArray *)dict)[i] = arr;
            }else if ([((NSMutableArray *)dict)[i] isKindOfClass:[NSDictionary class]]) {
                NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithDictionary:((NSMutableArray *)dict)[i]];
                [self visitDict:dic1];
                dict[i] = dic1;
            }
        }
    }
}
#pragma mark 简化递归封装
- (void)Visit:(id)visit_id{
    NSLog(@"分隔");
    if ([visit_id isKindOfClass:[NSArray class]]) {
        for (id object in visit_id) {
            if ([object isKindOfClass:[NSArray class]] && [self boolArrayClass:object]) {
                [self Visit:object];
                break;
            }
            if ([object isKindOfClass:[NSArray class]]) {
                [self Visit:object];
            }else if ([object isKindOfClass:[NSDictionary class]]) {
                [self Visit:object];
            }
        }
    }else if ([visit_id isKindOfClass:[NSDictionary class]]) {
        for (NSString *tt in [visit_id allKeys]) {
            NSLog(@"%@",tt);
            id value = visit_id[tt];
            if ([value isKindOfClass:[NSArray class]] && [self boolArrayClass:value]) {
                [self Visit:[value firstObject]];
                break;
            }
            if ([value isKindOfClass:[NSArray class]]) {
                [self Visit:value];
            }else if ([value isKindOfClass:[NSDictionary class]]) {
                [self Visit:value];
            }
        }
    }
}

#pragma mark 判断数组内的
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

@end
