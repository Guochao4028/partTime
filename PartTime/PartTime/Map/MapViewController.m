//
//  MapViewController.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "MapViewController.h"
#import "MapNavgationView.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "SearchViewController.h"
#import "PointAnnotation.h"

@interface MapViewController ()<MapNavgationViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate>

@property(nonatomic, strong)MapNavgationView *navgationView;

@property(nonatomic, strong)NSString *currLocationStr;

/** 定位 */
@property (nonatomic,strong) CLLocationManager *locationManager;
/** 地图 */
@property (nonatomic,strong) MKMapView * mapView;
/** 地理编码 */
@property (nonatomic, strong) CLGeocoder *geoC;
/** 发送请求给服务器 */
@property (nonatomic,strong) MKDirections *directions;
/** 目标位置标题 */
@property (nonatomic,copy) NSString *str;


@property(nonatomic, strong)NSArray *mapDataList;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initData];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initUI];
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


-(void)viewDidDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewDidDisappear:animated];
}

#pragma mark - private

-(void)initData{
    NSDictionary *dic = [self readLocalFileWithName:@"dizhi"];
    NSArray *temp = dic[@"locations"][@"location"];
    
    NSMutableArray *mutabelArray = [NSMutableArray array];
    
    for (NSDictionary *dic in temp) {
        if (dic[@"lat"] != nil && dic[@"lng"] != nil) {
            PointAnnotation *potint = [[PointAnnotation alloc]init];
            potint.coordinate = CLLocationCoordinate2DMake([dic[@"lat"] floatValue], [dic[@"lng"] floatValue]);
            
            potint.title = dic[@"name"];
            potint.subtitle = dic[@"city"];
            [mutabelArray addObject:potint];
        }
    }
    
    self.mapDataList = [NSMutableArray arrayWithArray:mutabelArray];
}

- (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

//初始化UI
-(void)initUI{
    //创建地图
    [self createMap];
    //创建定位
    [self createLocation];
    //创建导航按扭
    [self.view addSubview:self.navgationView];
}

-(void)createMap{

    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mapView.mapType =  MKMapTypeStandard;
    //显示指南针
    self.mapView.showsCompass = YES;
    //显示比例尺
    self.mapView.showsScale = YES;
    //显示用户所在的位置
    self.mapView.showsUserLocation = YES;
    //显示建筑物
    self.mapView.showsBuildings = YES;
    //显示感兴趣的东西
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.delegate =self;
    [self.mapView setUserTrackingMode:MKUserTrackingModeNone];
    CLLocationCoordinate2D coordinate = {40.7143, -74.006};
    [self.mapView setCenterCoordinate:coordinate animated:YES];
    
    [self.view addSubview:self.mapView];

    
    
    for (PointAnnotation *potint in self.mapDataList) {
        [self addAnnoWithPT:potint];
    }
    
}

-(void)createLocation{
    if ( [CLLocationManager  locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        //设置定位精度
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置距离
        self.locationManager.distanceFilter = 50;
        //申请定位许可，iOS8以后特有
        if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        //开始定位
        [self.locationManager startUpdatingLocation];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请打开定位权限" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - aciton
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)screen{
    SearchViewController *vc = [[SearchViewController alloc] init];
    vc.currLocationStr = self.currLocationStr;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - MapNavgationViewDelegate
-(void)selectJumpPage:(NSInteger)type{
    if (type == 0) {
        [self back];
    }else{
        [self screen];
    }
}

#pragma mark - 定位代理方法
//locationManager:didUpdateLocations:（调用很频繁）
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //定位：
    CLLocation *currLocation  =[locations lastObject];
//    NSLog(@"定位方法: %@ ",currLocation.description);
//    //重置定位
//    CLLocationCoordinate2D theCoordinate;
//    //latitude纬度
//    theCoordinate.latitude = currLocation.coordinate.latitude;
//    //longitude经度
//    theCoordinate.longitude = currLocation.coordinate.longitude;
//    //定义显示的范围span范围
//    MKCoordinateSpan theSpan;
//    theSpan.latitudeDelta =0.01;
//    theSpan.longitudeDelta =0.01;
//    //定义显示的区域 region区域范围
//    MKCoordinateRegion theRegion;
//    theRegion.center = theCoordinate;
//    theRegion.span = theSpan;
//    //设置地图显示
//    [self.mapView setRegion:theRegion];
    
    [self.geoC reverseGeocodeLocation:currLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placeMark in placemarks) {
            NSDictionary *addressDic = placeMark.addressDictionary;
            NSString *state=[addressDic objectForKey:@"State"];
            NSString *city=[addressDic objectForKey:@"City"];
            NSString *subLocality=[addressDic objectForKey:@"SubLocality"];
            NSString *street=[addressDic objectForKey:@"Street"];
            NSLog(@"surrLocation %@", [NSString stringWithFormat:@"%@ %@ %@ %@", state, city, subLocality, street]);
            self.currLocationStr = [NSString stringWithFormat:@"%@ %@ %@ %@", state, city, subLocality, street];
        }
    }];
    
    for (PointAnnotation *potint in self.mapDataList) {
        [self addAnnoWithPT:potint];
    }
}

//定位失败

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
}
//用于判断是否显示方向的校对,用于判断是否显示方向的校对,返回yes的时候，将会校对正确之后才会停止
//或者dismissheadingcalibrationdisplay方法解除。
-(BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager{
    return  YES;
}

#pragma mark -   地图代理方法有
//一个位置更改默认只会调用一次，不断监测用户的当前位置
//每次调用，都会把用户的最新位置（userLocation参数）传进来
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
//    userLocation.title = @"现在位置";
//    CLLocationCoordinate2D theCoordinate;
//    //latitude纬度
//    theCoordinate.latitude = userLocation.coordinate.latitude;
//    //longitude经度
//    theCoordinate.longitude= userLocation.coordinate.longitude;
//    [self.mapView setCenterCoordinate:theCoordinate animated:YES];
//    NSLog(@"用户定位: %f %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    
}

//地图的显示区域即将发生改变的时候调用
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}

//地图的显示区域已经发生改变的时候调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
}

////设置大头针
//- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
//
//    // 判断大头针位置是否在原点,如果是则不加大头针
//    if([annotation isKindOfClass:[mapView.userLocation class]]){
//        return nil;
//    }
//
//    static NSString *inden = @"pappao";
//    MKAnnotationView *pin = [mapView dequeueReusableAnnotationViewWithIdentifier:inden];
//    if (pin == nil) {
//        pin = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:inden];
//    }
//
//    pin.annotation = annotation;
//    // 设置是否弹出标注
//    pin.canShowCallout = YES;
//    pin.image = [UIImage imageNamed:@"map"];
//    pin.draggable = YES;
//
//    //弹出视图
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 25)];
//    imageView.image = [UIImage imageNamed:@"map1"];
//    pin.leftCalloutAccessoryView = imageView;
//
//    return pin;
//
//}


//添加大头针
-(void)addAnnoWithPT:(PointAnnotation *)pt{
    [self.mapView addAnnotation:pt];
}

#pragma mark - setter / getter

-(MapNavgationView *)navgationView{
    if (_navgationView == nil) {
        _navgationView  = [[MapNavgationView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 75)];
        [_navgationView setDelegate:self];
        _navgationView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _navgationView.layer.shadowOffset = CGSizeMake(2, 5);
        _navgationView.layer.shadowOpacity = 0.5;
        _navgationView.layer.shadowRadius = 5;
        
    }
    return _navgationView;
}

-(CLGeocoder *)geoC{
    if (_geoC == nil) {
        
        _geoC = [[CLGeocoder alloc]init];
        
    }
    return _geoC;
}




@end
