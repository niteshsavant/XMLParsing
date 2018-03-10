//
//  ViewController.h
//  XMLParsing
//
//  Created by Student P_04 on 23/01/18.
//  Copyright © 2018 deepk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryViewCell.h"

@interface ViewController : UIViewController<NSXMLParserDelegate>
{
    NSMutableArray *arrofCountries;
    NSMutableDictionary *dictofCountries;
    NSString *mstrXMLString;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tblofCountries;

@end

