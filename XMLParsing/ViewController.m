//
//  ViewController.m
//  XMLParsing
//
//  Created by Student P_04 on 23/01/18.
//  Copyright © 2018 deepk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self xmlParsingMethod];
}

- (void)xmlParsingMethod
{
    
    NSString *pathFile = [[NSBundle mainBundle] bundlePath];
    
    NSString *path = [[NSString alloc] initWithString:[pathFile stringByAppendingPathComponent:@"country.xml"]];
    
    NSURL *xmlURL = [NSURL fileURLWithPath:path];
    
    NSXMLParser *parser = [[ NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    
    NSLog(@"the parser xml is %@", parser);
    
    //the parser xml is <NSXMLParser:0x967d870>
    
    parser.delegate = self;
    
    [parser parse];

    [_tblofCountries reloadData];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict
{
    
    if ([elementName isEqualToString:@"NewDataSet"]) {
        arrofCountries = [[NSMutableArray alloc] init];
    }
    if ([elementName isEqualToString:@"Table"]) {
        dictofCountries = [[NSMutableDictionary alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName
{
    if ([elementName isEqualToString:@"Name"] ||
        
        [elementName isEqualToString:@"CountryCode"] ||
        
        [elementName isEqualToString:@"Currency"] ||
        
        [elementName isEqualToString:@"CurrencyCode"])
    {
        [dictofCountries setObject:mstrXMLString forKey:elementName];
    }
    
    if ([elementName isEqualToString:@"Table"])
    {
        [arrofCountries addObject:dictofCountries];
        NSLog(@"%@",arrofCountries);
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    mstrXMLString = string;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrofCountries.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CountryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryViewCell"];
    
    if (cell == nil)
    {
        cell = [[CountryViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CountryViewCell"];
    }
    
    NSDictionary *dict = [arrofCountries objectAtIndex:indexPath.row];
    
    cell.lblName.text = [dict valueForKey:@"Name"];
    cell.lblCountryCode.text = [dict valueForKey:@"CountryCode"];
    cell.lblCurrency.text = [dict valueForKey:@"Currency"];
    cell.lblCurrencyCode.text = [dict valueForKey:@"CurrencyCode"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
