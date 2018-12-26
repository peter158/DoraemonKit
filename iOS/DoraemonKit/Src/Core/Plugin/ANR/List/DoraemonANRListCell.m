//
//  DoraemonANRListCell.m
//  DoraemonKit-DoraemonKit
//
//  Created by yixiang on 2018/6/15.
//

#import "DoraemonANRListCell.h"
#import "DoraemonDefine.h"

@interface DoraemonANRListCell()


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation DoraemonANRListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor doraemon_black_1];
        _titleLabel.font = [UIFont systemFontOfSize:kDoraemonSizeFrom750(32)];
        [self.contentView addSubview:_titleLabel];
        
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage doraemon_imageNamed:@"doraemon_more"]];
        _arrowImageView.frame = CGRectMake(DoraemonScreenWidth-kDoraemonSizeFrom750(32)-_arrowImageView.doraemon_width, [[self class] cellHeight]/2-_arrowImageView.doraemon_height/2, _arrowImageView.doraemon_width, _arrowImageView.doraemon_height);
        [self.contentView addSubview:_arrowImageView];
    }
    return self;
}

- (void)renderCellWithData:(NSDictionary *)dic{
    self.titleLabel.text = dic[@"title"];
    [self.titleLabel sizeToFit];
    CGFloat w = self.titleLabel.doraemon_width;
    if (w > DoraemonScreenWidth-kDoraemonSizeFrom750(120)) {
        w = DoraemonScreenWidth-kDoraemonSizeFrom750(120);
    }
    self.titleLabel.frame = CGRectMake(kDoraemonSizeFrom750(32), [[self class] cellHeight]/2-self.titleLabel.doraemon_height/2, w, self.titleLabel.doraemon_height);
}

+ (CGFloat)cellHeight{
    return kDoraemonSizeFrom750(104);
}

@end