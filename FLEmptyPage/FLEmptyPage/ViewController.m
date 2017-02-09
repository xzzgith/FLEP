//
//  ViewController.m
//  FLEmptyPage
//
//  Created by Felix on 2017/1/22.
//  Copyright © 2017年 FREEDOM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<
UITableViewDelegate,
UITableViewDataSource,
FLEmptyPageDataSource,
FLEmptyPageDelegate
>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) App *app;

@end

@implementation ViewController

-(id)initWithApp:(App *)app{
    self = [super init];
    if (self) {
        self.app = app;
        self.title = app.displayName;
    }
    return self;
}
#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configureNavigationBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.ep_Delegate = self;
    self.tableView.ep_DataSource = self;
    
    
}
#pragma mark - FLEmptyPage delegate
- (BOOL)emptyPageShouldAllowScroll:(UIScrollView *)scrollView{
    return NO;
}
#pragma mark - FLEmptyPage datasource
- (UIColor *)backgroundColorForEmptyPage:(UIScrollView *)scrollView{
    switch (self.app.type) {
        case ApplicationType500px:  return [UIColor blackColor];
        case ApplicationTypeAirbnb: return [UIColor whiteColor];
        default:                    return nil;
    }
}

- (UIImage *)imageForEmptyPage:(UIScrollView *)scrollView{
    NSString *imageName = [[[NSString stringWithFormat:@"placeholder_%@", self.app.displayName] lowercaseString]stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    return [UIImage imageNamed:imageName];
}

- (NSAttributedString *)titleForEmptyPage:(UIScrollView *)scrollView{
    NSString *title = nil;
    UIFont *font = nil;
    UIColor *color = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    switch (self.app.type) {
        case ApplicationType500px:
        {
            title = @"No Photos";
            font = [UIFont boldSystemFontOfSize:17.0];
            color = [UIColor colorWithHex:@"545454"];
            break;
        }
        case ApplicationTypeAirbnb:
        {
            title = @"No Messages";
            font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
            color = [UIColor colorWithHex:@"c9c9c9"];
            break;
        }
        default:
            return nil;
    }
    if (!title) {
        return nil;
    }
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (color) [attributes setObject:color forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc]initWithString:title attributes:attributes];
}
- (NSAttributedString *)descriptionForEmptyPage:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    switch (self.app.type) {
        case ApplicationType500px:
        {
            text = @"Get started by uploading a photo.";
            font = [UIFont boldSystemFontOfSize:15.0];
            textColor = [UIColor colorWithHex:@"545454"];
            break;
        }
        case ApplicationTypeAirbnb:
        {
            text = @"When you have messages, you’ll see them here.";
            font = [UIFont systemFontOfSize:13.0];
            textColor = [UIColor colorWithHex:@"cfcfcf"];
            paragraph.lineSpacing = 4.0;
            break;
        }
        default:
            return nil;
    }
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    
    return attributedString;
}
#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}
- (void)configureNavigationBar
{
    UIColor *barColor = nil;
    UIColor *tintColor = nil;
    UIStatusBarStyle barstyle = UIStatusBarStyleDefault;
    
    self.navigationController.navigationBar.titleTextAttributes = nil;
    
    switch (self.app.type) {
        case ApplicationType500px:
        {
            barColor = [UIColor colorWithHex:@"242424"];
            tintColor = [UIColor colorWithHex:@"d7d7d7"];
            barstyle = UIStatusBarStyleLightContent;
            break;
        }
        case ApplicationTypeAirbnb:
        {
            barColor = [UIColor colorWithHex:@"f8f8f8"];
            tintColor = [UIColor colorWithHex:@"08aeff"];
            break;
        }
            
        default:
            barColor = [UIColor colorWithHex:@"f8f8f8"];
            tintColor = [UIApplication sharedApplication].keyWindow.tintColor;
            break;
    }
    
    UIImage *logo = [UIImage imageNamed:[NSString stringWithFormat:@"logo_%@", [self.app.displayName lowercaseString]]];
    if (logo) {
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:logo];
    }
    else {
        self.navigationItem.titleView = nil;
        self.navigationItem.title = self.app.displayName;
    }
    
    self.navigationController.navigationBar.barTintColor = barColor;
    self.navigationController.navigationBar.tintColor = tintColor;
    
    [[UIApplication sharedApplication] setStatusBarStyle:barstyle animated:YES];
}
- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}
@end
