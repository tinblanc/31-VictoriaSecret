//
//  BraVC.m
//  VictoriaSecret
//
//  Created by Tin Blanc on 4/19/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "BraVC.h"
#import "DataManager.h"
#import "VSModel.h"

@interface BraVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;

@end

@implementation BraVC
{
    DataManager* dataManager;
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dataManager = [DataManager getSingleton];
    
    self.pageControl.numberOfPages = dataManager.data.count;
    CGSize scrollViewSize = self.scrollView.bounds.size;
    self.scrollView.contentSize = CGSizeMake(scrollViewSize.width * dataManager.data.count, scrollViewSize.height);
    
    self.scrollView.pagingEnabled = true;
    int i = 0 ;
    for (VSModel* model in dataManager.data) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:model.photo];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(i * scrollViewSize.width, 0, scrollViewSize.width, scrollViewSize.height);
        
        [self.scrollView addSubview:imageView];
        i++;
    }
    
    [self updateLabelAt:0];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    [self updateLabelAt:(int)self.pageControl.currentPage];
}

#pragma mark - Ulti Function
-(void) updateLabelAt:(int)index{
    
    VSModel* model = dataManager.data[index];
    self.modelLabel.text = [NSString stringWithFormat:@"%@\n%@", model.name, model.measure];
    CGSize labelSize = [self.modelLabel.text sizeWithAttributes:@{NSFontAttributeName:self.modelLabel.font}]; // trả về kích thước của Label khi được gán, và lấy font của chính label đang sử dụng
    
    self.modelLabel.frame = CGRectMake(self.modelLabel.frame.origin.x, self.modelLabel.frame.origin.y, self.modelLabel.frame.size.width, labelSize.height);
    
    
}

- (IBAction)onPageControllChange:(UIPageControl *)sender {
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * self.scrollView.bounds.size.width, 0);
}


@end
