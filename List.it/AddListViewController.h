//
//  AddListViewController.h
//  List.it
//
//  Created by Patrick Asare on 3/15/13.
//  Copyright (c) 2013 Patrick Asare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactCell.h"

@interface AddListViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *contactsTable;
@property (weak, nonatomic) IBOutlet UITableView *infoTable;
@property  UITextField *nameField;
@property UITextView *descText;
@property UISwitch *switchControl;
@end
