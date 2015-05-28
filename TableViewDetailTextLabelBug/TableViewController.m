//
//  TableViewController.m
//  TableViewDetailTextLabelBug
//
//  Created by 羊小咩 on 2015/5/28.
//  Copyright (c) 2015年 羊小咩. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    NSArray *dataArray;
    NSInteger idx;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    idx = 0;
    
    
    

     self.clearsSelectionOnViewWillAppear = NO;
    

    [self checkData];
}

-(void)checkData
{
    NSInteger _idx = idx % 3;
    if (_idx == 0 ) {
        dataArray = @[@{@"title":@"Index"  ,  @"value":@"0"} ,
                      @{@"title":@"正常"  ,  @"value":@"A"} ,
                      @{@"title":@"有問題空字串"  ,  @"value":@""},
                      @{@"title":@"空白沒問題"  ,  @"value":@" "}];
    }else if(_idx == 1){
        dataArray = @[@{@"title":@"Index"  ,  @"value":@"1"} ,
                      @{@"title":@"正常"  ,  @"value":@"AA"} ,
                      @{@"title":@"空白沒有更新"  ,  @"value":@"B"},
                      @{@"title":@"空白沒問題"  ,  @"value":@"C"}];
    }else{
        dataArray = @[@{@"title":@"Index"  ,  @"value":@"2"} ,
                      @{@"title":@"正常"  ,  @"value":@"AAA"} ,
                      @{@"title":@"上次有值後又正常"  ,  @"value":@"BB"},
                      @{@"title":@"空白沒問題"  ,  @"value":@"CC"}];
    }
    
    idx ++;

}

- (IBAction)actBtn_clickHandle:(id)sender {
    
    [self checkData];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    id infoItem = [dataArray objectAtIndex:indexPath.row];

    cell.textLabel.text = [infoItem valueForKey:@"title"];
    cell.detailTextLabel.text  = [infoItem valueForKey:@"value"];
    
    //顏色修改
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    return cell;
}



@end
