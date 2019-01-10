//
//  DBManager.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DBManager.h"
#import "MJExtension.h"
#import "JobsModel.h"

@interface DBManager()
@end

@implementation DBManager

static DBManager *_instance;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance == nil)
            _instance = [[DBManager alloc] init];
    });
    return _instance;
}

-(void)savePlist:(id)model{
    NSString *filePath = [self getDocumentsPath];
    NSMutableArray *array;
    if ([self fileExistsAtPath:filePath] == NO) {
        array = [[NSMutableArray alloc] init];
    }else{
        array = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        
    }
    NSDictionary *modelDic = [model mj_keyValues];
    [array addObject:modelDic];
    [array writeToFile:filePath atomically:YES];
}

-(void)deleteFileToPlist{
    NSFileManager *manager=[NSFileManager defaultManager];
    //文件路径
    NSString *filepath = [self getDocumentsPath];//这里就是你将要删除的沙盒路径（.plist文件，名字自定义）
    if ([manager removeItemAtPath:filepath error:nil]) {
        NSLog(@"文件删除成功");
    }
}


-(void)deleteOnce:(NSInteger)location{
    NSString *filePath = [self getDocumentsPath];
    
    if ([self fileExistsAtPath:filePath] == YES) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        [array removeObjectAtIndex:location];
        [array writeToFile:filePath atomically:YES];
    }
}

-(NSArray *)queryPlist{
    NSString *filePath = [self getDocumentsPath];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    NSArray *array = [JobsModel mj_objectArrayWithKeyValuesArray:mutableArray];
    return array;
}

//文件是否存在
-(BOOL)fileExistsAtPath:(NSString *)filePath{
    BOOL flag = NO;
    flag =[[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return flag;
}

//获取Documentsm目录
-(NSString *)getDocumentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"save.plist"];
    NSLog(@"%@",plistPath);
    return plistPath;
}


@end
