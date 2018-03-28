//
//  TYExampleController.m
//  TYToolSet
//
//  Created by user001 on 2018/3/28.
//  Copyright © 2018年 Sheldon. All rights reserved.
//

#import "TYExampleController.h"
#import "TYExampleItem.h"
#import "TYPhotoPickerController.h"
#import "TYDrawViewController.h"

@interface TYExampleController ()<UITableViewDelegate, UITableViewDataSource>
//tableView
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * items;
@end

@implementation TYExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TYExampleItem * item0 = [TYExampleItem itemWithTitle:@"选取相册" object:[TYPhotoPickerController class]];
    TYExampleItem * item1 = [TYExampleItem itemWithTitle:@"绘制文字" object:[TYDrawViewController class]];
    
    _items = [NSArray arrayWithObjects:item0, item1, nil];
    
    [self setUpTableView];
}

- (void)setUpTableView {
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYExampleItem * item = _items[indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = item.title;
    return cell;
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TYExampleItem * item = _items[indexPath.row];
    Class itemClass = item.itemClass;
    [self.navigationController pushViewController:[itemClass new] animated:YES];
}

@end
