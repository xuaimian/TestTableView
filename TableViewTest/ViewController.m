//
//  ViewController.m
//  TableViewTest
//
//  Created by spring on 2019/8/16.
//  Copyright © 2019 spring. All rights reserved.
//

#import "ViewController.h"
#import "CustomerTableViewCell.h"
#import "ViewControllerZW2f.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.estimatedRowHeight = 80;
//    [tableview registerClass:CustomerTableViewCell.self forCellReuseIdentifier:@"tableviewcell"];
    [tableview registerNib:[UINib nibWithNibName:@"CustomerTableViewCell" bundle:nil] forCellReuseIdentifier:@"tableviewcell"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSArray *)namesList{
    return @[@"1111",@"222",@"333",@"444",@"5555"];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewcell"];
    cell.titleLabel.text = [self namesList][indexPath.row];
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return   [[self namesList] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    ViewControllerZW2f *vw2f = [[ViewControllerZW2f alloc] init] ;
    [self presentViewController:vw2f animated:true completion:nil];
}



@end
