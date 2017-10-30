//
//  AssignmentDetailViewController.swift
//  S4MAssignment1
//
//  Created by Akhil Mittal on 28/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit
import XLForm

class AssignmentDetailViewController: XLFormViewController
{
    fileprivate struct Tags {
        static let CustomRowFloatLabeledTextFieldTag = "CustomRowFloatLabeledTextFieldTag"
    }
    @IBOutlet var inviteeTableViewHolder: UIView!
    @IBOutlet var inviteeTableViewHolderHeightConstraint: NSLayoutConstraint!
    @IBOutlet var scrollViewBackViewHeight: NSLayoutConstraint!
    var selectedInviteeArrayInSession:[InviteeModel]!
    
    var addBoolValue = false


    @IBAction func addInvitee(_ sender: UIButton)
    {
        let addInviteeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddInviteeViewController") as! AddInviteeViewController
        self.navigationController?.pushViewController(addInviteeViewController, animated: true)
        addBoolValue = true
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
      if(addBoolValue)
      {
        var appdelegateObj = UIApplication.shared.delegate as! AppDelegate

      selectedInviteeArrayInSession =   appdelegateObj.assignmentDetailViewControllerInAppdelegate.selectedInviteeArrayInSession
        print(selectedInviteeArrayInSession.count)
      print(selectedInviteeArrayInSession[0].name)
        let assign:AssignTableview =  AssignTableview()
        assign.initializeData(controller: self , selectedInviteeArrayInSes : InviteeModel())
        inviteeTableViewHolder.addSubview(assign)
      }
    }

    @IBOutlet var inviteeScroolViewObj: UIScrollView!

    var sessionObj = SessionModel()

    override func viewDidLoad() {
     selectedInviteeArrayInSession = [InviteeModel]()

        initializeForm()
       self.tableView.reloadData()
        super.viewDidLoad()
        inviteeScroolViewObj.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        scrollViewBackViewHeight.constant = inviteeScroolViewObj.contentSize.height
        let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        editButton.setTitle("Edit", for: .normal)
        editButton.showsTouchWhenHighlighted = true
        editButton.setTitleColor(UIColor.blue, for: .normal)
        editButton.addTarget(self,action:#selector(EditClicked),for:.touchUpInside)
        let rightBtn = UIBarButtonItem(customView: editButton)
        
        navigationItem.rightBarButtonItem = rightBtn
        // Do any additional setup after loading the view.
    }
    
    func EditClicked(sender:UIButton)
    {
        self.view.endEditing(true)
        if self.form.isDisabled{
            sender.setTitle("Save", for: .normal)
            self.form.isDisabled = false
        }else{
            sender.setTitle("Edit", for: .normal)
            self.form.isDisabled = true
        }
        self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func initializeForm() {
        
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Details")
        
        // Section Float Labeled Text Field
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Subject")
        row.value = sessionObj.Subject
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Location")
        row.value = sessionObj.Location
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Type")
        row.value = sessionObj.ActivityType
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Start")
        row.value = GetDateTime(dateTime: sessionObj.ActivityStartDateTime)

        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "End")
        row.value = GetDateTime(dateTime: sessionObj.ActivityEndDateTime)
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Account")
        row.value = sessionObj.AccountName
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Opportunity")
        row.value = sessionObj.OpportunityName
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Lead")
        row.value = sessionObj.LeadName
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Primary Contact")
        row.value = sessionObj.PrimaryContactName
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.CustomRowFloatLabeledTextFieldTag, rowType: XLFormRowDescriptorTypeFloatLabeledTextField, title: "Description")
        row.value = sessionObj.Description
        section.addFormRow(row)
        
        self.form = form
        self.form.isDisabled = true
    }
    
    
    func GetDateTime(dateTime:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:dateTime)!
        
        let headerDateFormatter = DateFormatter()
        headerDateFormatter.dateFormat = "EEEE, MM/dd/yyyy, hh:mm a"
        headerDateFormatter.timeZone = TimeZone.current
        let dateStamp = headerDateFormatter.string(from: date)
        return dateStamp
    }


}







