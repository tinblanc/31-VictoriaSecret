//
//  FoodVC.m
//  food
//
//  Created by Tin Blanc on 4/23/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "FoodVC.h"
#import "DataManager.h"
#import "FoodModel.h"
#import "UIColor+Extend.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]


@interface FoodVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;


@end

@implementation FoodVC
{
    DataManager* dataManager;
}


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    NSLog(@"%f", self.view.bounds.size.height);
    dataManager = [DataManager getSingleTon]; // lấy dữ liệu
    self.pageControl.numberOfPages = dataManager.data.count; // lấy số lượng đối tượng
    CGSize scrollViewSize = self.scrollView.bounds.size;
    self.scrollView.contentSize = CGSizeMake(scrollViewSize.width * dataManager.data.count, scrollViewSize.height); // chiều rộng nhân với số lượng ảnh
    self.scrollView.pagingEnabled = true; // hiệu ứng paging
    self.scrollView.showsHorizontalScrollIndicator = false;
    self.scrollView.delegate = self;
    
    
    int i = 0 ;
    for (FoodModel* model in dataManager.data) {
        
        
        // Tạo scrollView bên trong
        UIScrollView* scrollViewInside = [[UIScrollView alloc] initWithFrame:CGRectMake(i * scrollViewSize.width +10 , 10 , scrollViewSize.width -20, scrollViewSize.height-20)];
        
        scrollViewInside.contentSize = CGSizeMake(scrollViewInside.bounds.size.width, scrollViewInside.bounds.size.height + 200);
        scrollViewInside.pagingEnabled = true;
        scrollViewInside.backgroundColor = [UIColor whiteColor];
        scrollViewInside.layer.cornerRadius = 3.0;
        scrollViewInside.showsHorizontalScrollIndicator = false;
        scrollViewInside.showsVerticalScrollIndicator = false;

        int r = arc4random_uniform(100) + 20;
        
        // Tạo imageView hiển thị ảnh
        UIImageView* imageView = [[UIImageView alloc] initWithImage:model.photo];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = CGRectMake(0, 0, scrollViewInside.bounds.size.width, scrollViewInside.bounds.size.height - 150 - r);
        imageView.backgroundColor = [UIColor redColor];

        

        // Tạo label hiển thị tên
        UILabel* lblName = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.bounds.size.height + 10, imageView.bounds.size.width, 30)];
        lblName.lineBreakMode = 0;
        lblName.text = model.name;
        lblName.textAlignment = NSTextAlignmentCenter;
        lblName.textColor = [[UIColor alloc] initWithHex:@"424242" alpha:1.0];
        lblName.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        
        
        
        // ImageView icon Price
        UIImageView* iconPrice = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"price"]];
        iconPrice.frame = CGRectMake(scrollViewInside.bounds.size.width * 0.5 - 60, imageView.bounds.size.height + 40 , 14 , 14);
        
        
        // Tạo label hiển thị Price
        UILabel* lblPrice = [[UILabel alloc] initWithFrame:CGRectMake(scrollViewInside.bounds.size.width * 0.5 - 45, imageView.bounds.size.height + 40 , 150 , 14)];
        lblPrice.text = model.price;
        [lblPrice setFont:[UIFont systemFontOfSize:10]];
        lblPrice.textColor = [[UIColor alloc] initWithHex:@"afb4b6" alpha:1.0];
        
        
        
//        UITableView* tblViewInfomation = [[UITableView alloc] initWithFrame:CGRectMake(10 , imageView.bounds.size.height + 80 , imageView.bounds.size.width - 20 , 60)];
//        tblViewInfomation.layer.cornerRadius = 3.0;
//        tblViewInfomation.layer.borderWidth = 1.0;
//        tblViewInfomation.layer.borderColor = [[[UIColor alloc] initWithHex:@"4c8bbe" alpha:1.0] CGColor];
//        tblViewInfomation.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UIView* viewInfomation = [[UIView alloc] initWithFrame:CGRectMake(10 , imageView.bounds.size.height + 80 , imageView.bounds.size.width - 20 , 80)];
        viewInfomation.layer.borderWidth = 1.0;
        viewInfomation.layer.cornerRadius = 3.0;
        viewInfomation.layer.borderColor = [[[UIColor alloc] initWithHex:@"4c8bbe" alpha:1.0] CGColor];
        
        
        // Label bên trong View Infomation
        UILabel* lblName2 = [[UILabel alloc] initWithFrame:CGRectMake(10 , 2 , imageView.bounds.size.width - 30 , 30)];
        lblName2.text = model.name;
        lblName2.textColor = [[UIColor alloc] initWithHex:@"4c8bbe" alpha:1.0];
        lblName2.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        
        
        UILabel* lblAddress = [[UILabel alloc] initWithFrame:CGRectMake(11, 22, imageView.bounds.size.width -30 , 30)];
        lblAddress.text = model.address;
        lblAddress.textColor = [[UIColor alloc] initWithHex:@"afafb2" alpha:1.1];
        [lblAddress setFont:[UIFont systemFontOfSize:12]];
        
        
        UIImageView* iconPrice2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"price2"]];
        iconPrice2.frame = CGRectMake(10, 52 , 15 , 15);
        
        UILabel* lblPrice2 = [[UILabel alloc] initWithFrame:CGRectMake(26, 52, imageView.bounds.size.width - 50, 14)];
        lblPrice2.text = [NSString stringWithFormat:@"%@ / 1 người", model.price];
        [lblPrice2 setFont:[UIFont systemFontOfSize:12]];
        lblPrice2.textColor = [[UIColor alloc] initWithHex:@"424242" alpha:1.0];
        
        UIImageView* iconArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        iconArrow.frame = CGRectMake(viewInfomation.frame.size.width - 40, viewInfomation.frame.size.height * 0.5 - 15, 30, 30);
        
        
        
        [viewInfomation addSubview:iconArrow];
        [viewInfomation addSubview:lblPrice2];
        [viewInfomation addSubview:iconPrice2];
        [viewInfomation addSubview:lblAddress];
        [viewInfomation addSubview:lblName2];
        
        [scrollViewInside addSubview:viewInfomation];
        [scrollViewInside addSubview:lblPrice];
        [scrollViewInside addSubview:iconPrice];
        [scrollViewInside addSubview:lblName];
        [scrollViewInside addSubview:imageView];
        
        
        [self.scrollView addSubview:scrollViewInside];
        i++;
    }

    
}



#pragma mark - UIScrollViewDelegate
-(void) scrollViewDidScroll:(UIScrollView*) scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
}


#pragma mark - Ulti Function




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
