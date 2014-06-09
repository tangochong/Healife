//
//  ProfileViewController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "ProfileViewController.h"
#import "DetailTitleViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"针灸推拿大讲堂";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"常见针灸推拿知识";
        cell.detailTextLabel.text = @"针灸和推拿属养生治病之道。针、灸有别，针法指在体表的腧穴上进行针刺、叩击、放血等操作，灸则指用艾绒做成艾柱、艾条或艾绒装入温灸器中，点燃后熏灼皮肤的一定穴位，进行温热刺激。 推拿，又称按摩，古称按跷、案抚。最早发现于明朝儿科专家万全所著《幼科发挥》，后经过手法的发展演变，变成了现...";
        cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    }else if (indexPath.row == 1 ){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"推拿简史";
        cell.detailTextLabel.text = @" 推拿，古称按摩，是祖国医学宝库中一颗璀璨的明珠。历史悠久，源远流长。长沙马王堆出土的大批帛书和竹木简上就记载了大量按摩、导引、吐纳等内容，这些出土的医书反映了春秋战国或者更早时期，按摩疗法就被广泛地应用于临床治疗。 按摩治病最早发源于我国中部地区。据现存最早的医学经典巨著《黄帝内经》曰：“中央者其地平以湿，天地之所以生万物之众，其民食杂而不劳，故其病多痿厥寒热，其治宜导引按蹻，故导引按蹻者，亦从中央出也”。这里的中央即我国的中部地区，属河南洛阳一带。";
        cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    }else if (indexPath.row == 2 ){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"推拿常用诊断方法";
        cell.detailTextLabel.text = @"推拿治疗在临床上最多应用的还是颈、肩、腰腿疼痛和四肢骨关节、肌肉、神经等病变，为了杜绝不必要的医疗事故发生，现代医学的诊断方法是完全可以借鉴并融为一体的。通过此方法可以排除炎症、肿瘤等各种非推拿治疗适应证的疾病。而且还能使疾病得到明确诊断和提高治疗效果。";
        cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailTitleViewController *detail = [[DetailTitleViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
