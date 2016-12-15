//
//  ____model____Tests.m
//  复杂生成model逻辑梳理Tests
//
//  Created by 海神 on 2016/12/10.
//  Copyright © 2016年 海神. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ____model____Tests : XCTestCase
@property (nonatomic, strong) NSString *xxxx;
@end

@implementation ____model____Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSDictionary *infodic = @{@"Status":@1,@"TotalCount":@"42",@"biantai":@{@"zhenshibiantai":@"",@"shia":@3.3,@"haihao":@YES},@"TotalPages":@5,@"CurrentPage":@"1",@"Result":@[@{@"id":@"66",@"goods_name":@"电风扇",@"img":@"Public\/Uploads\/2016-12-07\/5847acb9d3e4e.jpg",@"good_img":@"",@"good_num":@"0342078121",@"stock":@"86",@"goods_price":@"1500",@"goods_integral":@"5000",@"goods_synopsis":@"你好",@"goods_addtime":@"2016-12-07",@"is_index":@"1",@"is_popular":@"1"},@{@"id":@"65",@"goods_name":@"智享电饼铛ACCK-032",@"img":@"Public\/Uploads\/2016-07-11\/57833d658d883.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143112_61190.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143119_19615.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143119_63684.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711143119_26993.jpg,@",@"good_num":@"0230403232",@"stock":@"54",@"goods_price":@"528",@"goods_integral":@"20000",@"goods_synopsis":@"Eupa\/灿坤 精致悬浮式 双面使用ACCK-032智享 电饼铛",@"goods_addtime":@"2016-12-09",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"64",@"goods_name":@"意式咖啡机ZCYLKS-045",@"img":@"Public\/Uploads\/2016-07-11\/57833d0c816f8.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142952_49402.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142952_39248.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142952_64775.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142953_30365.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142953_59954.jpg,@",@"good_num":@"0229165815",@"stock":@"23",@"goods_price":@"688",@"goods_integral":@"30000",@"goods_synopsis":@"正品Electrolux\/伊莱克斯 ZCYLKS-045意式咖啡机 带蒸汽喷嘴咖啡机",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"63",@"goods_name":@"伊莱克斯TRUE-LOVE单杯咖啡机ZCYLKS-030",@"img":@"Public\/Uploads\/2016-07-11\/57833cb8dc55c.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142748_37888.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142748_27589.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142749_86525.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142749_55296.jpg,@",@"good_num":@"0227261546",@"stock":@"55",@"goods_price":@"178",@"goods_integral":@"8000",@"goods_synopsis":@"Electrolux\/伊莱克斯 ZCYLKS-030 单杯咖啡机 滴漏式咖啡壶 迷你家用",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"62",@"goods_name":@"伊莱克斯多功能电火锅ZCYLKS-025",@"img":@"Public\/Uploads\/2016-07-11\/57833c38db58d.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142529_14059.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142529_58872.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142530_94169.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142530_10241.jpg,@",@"good_num":@"0224532086",@"stock":@"36",@"goods_price":@"358",@"goods_integral":@"15500",@"goods_synopsis":@"伊莱克斯多功能电火锅ZCYLKS-025白色1.5L一体电火锅",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"61",@"goods_name":@"伊莱克斯电炖盅ZCYLKS-032",@"img":@"Public\/Uploads\/2016-07-11\/57833bb13a1cc.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142351_23881.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142351_49699.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142352_21972.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142352_12529.jpg,@",@"good_num":@"0223141510",@"stock":@"32",@"goods_price":@"188",@"goods_integral":@"8500",@"goods_synopsis":@"Electrolux\/伊莱克斯 电炖盅儿童电炖锅ZCYLKS-032 母婴陶瓷",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"60",@"goods_name":@"伊莱克斯电炖锅ZCYLKS-028",@"img":@"Public\/Uploads\/2016-07-11\/57833b4e0f603.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142121_88686.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142122_66593.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142122_30354.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711142122_71119.jpg,@",@"good_num":@"0220406767",@"stock":@"35",@"goods_price":@"428",@"goods_integral":@"11000",@"goods_synopsis":@"伊莱克斯陶瓷电炖锅ZCYLKS-028电炖盅3L白瓷熬粥煮粥煲汤养生慢炖锅",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"59",@"goods_name":@"伊莱克斯打蛋器ZCYLKS-042",@"img":@"Public\/Uploads\/2016-07-11\/57833ab49b788.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141636_72402.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141638_32206.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141638_98313.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141638_17690.jpg,@",@"good_num":@"0216108625",@"stock":@"70",@"goods_price":@"288",@"goods_integral":@"12000",@"goods_synopsis":@"伊莱克斯打蛋器ZCYLKS-042打蛋、搅拌双功能",@"goods_addtime":@"2016-12-01",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"57",@"goods_name":@"新秀丽时尚休闲包深蓝色SN-125E",@"img":@"Public\/Uploads\/2016-07-11\/5783393aafc13.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141158_65939.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141205_97415.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141205_52324.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711141206_60457.jpg,@",@"good_num":@"0211365257",@"stock":@"56",@"goods_price":@"680",@"goods_integral":@"15000",@"goods_synopsis":@"新秀丽SN-125e双肩电脑包",@"goods_addtime":@"2016-07-11",@"is_index":@"0",@"is_popular":@"0"},@{@"id":@"56",@"goods_name":@"新秀丽时尚休闲包 橙色SN-123E",@"img":@"Public\/Uploads\/2016-07-11\/578338879f26c.jpg",@"good_img":@"\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140818_91007.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140825_96105.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140826_17890.jpg,\/kindeditor\/php\/..\/attached\/image\/20160711\/20160711140826_88815.jpg,@",@"good_num":@"0207509868",@"stock":@"39",@"goods_price":@"680",@"goods_integral":@"15000",@"goods_synopsis":@"新秀丽SN-123e双肩电脑包",@"goods_addtime":@"2016-07-11",@"is_index":@"0",@"is_popular":@"0"}]};
    NSInteger i = 2;
//    [i class];
    
//    NSLog(@"%@",NSStringFromClass([i class]));
    NSLog(@"开始");
    [self Thought:infodic];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

// 第一次进入肯定是字典

- (void)Thought:(id)code{
    NSLog(@"@interface model : NSObject");
    NSMutableArray *flagArr = [NSMutableArray array];
    if ([code isKindOfClass:[NSArray class]]) {
        if ([self boolArrayClass:code]) {
            //对象一致只取出一个就够了
            id object = [code firstObject];
            //分为两种情况，一种是 基本数据类型 另一种 不是基本数据类型
            if ([object isKindOfClass:[NSNumber class]]) {
                @{@"cc":@[]};
            }else{
                //对象为字典类型 ----说明里面还需要在生成一个对象
                if ([object isKindOfClass:[NSDictionary class]]) {
                    
                //对象为数组类型
                }else if ([object isKindOfClass:[NSArray class]]) {
                    
                //对象为字符串
                }else if ([object isKindOfClass:[NSString class]]) {
                    
                //逻辑之外
                }else{
                    NSLog(@"无逻辑代码判断");
                }
            }
            
        }else{
            NSLog(@"无逻辑代码判断");
        }
    }else if ([code isKindOfClass:[NSDictionary class]]) {
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
                    last_Str = [NSString stringWithFormat:@"%@ *",propety];
                    [flagArr addObject:code[propety]];
                }else if ([code[propety] isKindOfClass:[NSArray class]]) {
                    //如果输数组 这里需要一个泛型
                    last_Str = [NSString stringWithFormat:@"NSArray <%@ *> ",propety];
                    [flagArr addObject:[code[propety] firstObject]];
                }else{
                    NSLog(@"没有考虑到的情况");
                }
            }
            NSString *propetyWhole = [NSString stringWithFormat:@"%@%@%@%@;",before_Str,center_Str,last_Str,propety];
            NSLog(@"%@",propetyWhole);
        }
    }else{
        NSLog(@"无逻辑代码判断");
    }
    NSLog(@"@end");
    for (NSDictionary *dic in flagArr) {
        [self Thought:dic];
    }
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
    }
    else{
        NSLog(@"逻辑之外，需要检查");
        return @"逻辑之外，需要检查";
    }
}
#pragma mark 简化递归封装
- (void)Visit:(id)visit_id{
    NSLog(@"@interface ###");
    if ([visit_id isKindOfClass:[NSArray class]]) {
        for (id object in visit_id) {
            if ([object isKindOfClass:[NSArray class]] && [self boolArrayClass:object]) {
                NSLog(@"@end");
                [self Visit:object];
                break;
            }
            if ([object isKindOfClass:[NSArray class]]) {
                NSLog(@"@end");
                [self Visit:object];
            }else if ([object isKindOfClass:[NSDictionary class]]) {
                NSLog(@"@end");
                [self Visit:object];
            }
        }
        NSLog(@"分割线-------------------");
    }else if ([visit_id isKindOfClass:[NSDictionary class]]) {
        for (NSString *tt in [visit_id allKeys]) {
            NSLog(@"%@",tt);
            id value = visit_id[tt];
            if ([value isKindOfClass:[NSArray class]] && [self boolArrayClass:value]) {
                NSLog(@"@end");
                [self Visit:[value firstObject]];
                break;
            }
            if ([value isKindOfClass:[NSArray class]]) {
                NSLog(@"@end");
                [self Visit:value];
            }else if ([value isKindOfClass:[NSDictionary class]]) {
                NSLog(@"@end");
                [self Visit:value];
            }
        }
        NSLog(@"分割线-------------------");
    }
}
@end
