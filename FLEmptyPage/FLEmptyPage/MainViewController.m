//
//  MainViewController.m
//  FLEmptyPage
//
//  Created by Felix on 2017/2/9.
//  Copyright © 2017年 FREEDOM. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "FLEmpty.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray * apps;
@end

@implementation MainViewController

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"f8f8f8"];;
    //    self.navigationController.navigationBar.translucent = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FelixEP";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
    [self configureDataThen:^{
        
    }];
}

- (void)configureDataThen:(void(^)(void))then{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"applications" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted |kNilOptions error:nil];
    
    self.apps = [NSMutableArray new];
    for (int i = 0; i<arr.count; i++) {
        App * obj = [[App alloc]initWithDictionary:arr[i]];
        [self.apps addObject:obj];
    }
    
    if (self.apps.count) {
        then();
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.apps.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"app_obj_identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    App *obj = self.apps[indexPath.row];
    cell.textLabel.text = obj.displayName;
    cell.detailTextLabel.text = obj.developerName;
    
    UIImage *image = [UIImage imageNamed:obj.iconName];
    cell.imageView.image = image;
    
    cell.imageView.layer.cornerRadius = image.size.width*0.2;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.borderWidth = 0.5;
    cell.imageView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
    
    cell.imageView.layer.shouldRasterize = YES;
    cell.imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    App *app = self.apps[indexPath.row];
    ViewController *vc = [[ViewController alloc]initWithApp:app];
    vc.apps = self.apps;
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
