//
//  ContactCell.h
//  List.it
//
//  Created by Patrick Asare on 3/16/13.
//  Copyright (c) 2013 Patrick Asare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end
