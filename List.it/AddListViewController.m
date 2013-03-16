//
//  AddListViewController.m
//  List.it
//
//  Created by Patrick Asare on 3/15/13.
//  Copyright (c) 2013 Patrick Asare. All rights reserved.
//

#import "AddListViewController.h"

@interface AddListViewController ()

@end

@implementation AddListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Dismiss keyboard with tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Dismiss keyboard on tap anywhere
-(void)dismissKeyboard
{
    [ _nameField resignFirstResponder];
    [ _descText resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    if (theTextField == _nameField) {
        [theTextField resignFirstResponder];
        [_descText becomeFirstResponder ];
    }
    return YES;
}

//table view delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _infoTable) {
    if (section == 1)
        return 1;
    else
        return 2;
    }
    else return 10;
}

//create the textboxes here
- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //For the info table
    if (table == _infoTable) {
        UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:@"Cell"];
        if( cell == nil)
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        if (indexPath.section == 0){
            if (indexPath.row == 0) {
                _nameField = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, 195, 21)];
                _nameField.autocorrectionType = UITextAutocorrectionTypeNo;
                [_nameField setClearButtonMode:UITextFieldViewModeWhileEditing];
                [_nameField setReturnKeyType:UIReturnKeyNext];
                _nameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
                cell.textLabel.text = @"Title";
                cell.accessoryView = _nameField ;
            }
            if (indexPath.row == 1) {
                _descText = [[UITextView alloc] initWithFrame:CGRectMake(5, 0, 175, 70)];
                _descText.autocorrectionType = UITextAutocorrectionTypeNo;
                [_descText setReturnKeyType:UIReturnKeyDone];
                [_descText setBackgroundColor:[UIColor clearColor]];
                cell.textLabel.text = @"Description";
                //cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
                cell.accessoryView = _descText;
            }
            _nameField.delegate = self;
            _descText.delegate = self;
    
    
            [_infoTable addSubview:_nameField];
            [_infoTable addSubview:_descText];
            //cell.backgroundColor = [UIColor colorWithRed:210/255.0f green:226/255.0f blue:245/255.0f alpha:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                _switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(35, 200, 150, 40)];
                cell.textLabel.text = @"Calculate Totals";
                [_switchControl setBackgroundColor:[UIColor clearColor]];
                [_switchControl addTarget:self action:@selector(actionSwitch:) forControlEvents:UIControlEventTouchUpInside];
                cell.accessoryView = _switchControl;
            
            }
        }
       return cell; 
    }
    //For the contacts table
    else {
        static NSString *cellIdentifier = @"contactCell";
        ContactCell *cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ContactCellView" owner:nil options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[ContactCell class]])
            {
                cell = (ContactCell *)currentObject;
                break;
            }
        }
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _infoTable)
        return 2;
    else
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == _infoTable) {
        switch (indexPath.row){
            case 1:
                if(indexPath.section==0)
                    return 123.0;
            default:
                return 40.0;
        }
    }
    else
        return 31.0;
}

@end
