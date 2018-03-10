//
//  CountryViewCell.h
//  XMLParsing
//
//  Created by Student P_04 on 23/01/18.
//  Copyright © 2018 deepk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblCountryCode;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrency;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrencyCode;

@end
