//
//  AddInviteeViewController.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 26/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class AddInviteeViewController: UIViewController {
    
   public var allInviteeArray:[InviteeModel]!
     var selectedInviteeArray:[InviteeModel]!
    var cell : AddTableViewTableViewCell!
    @IBOutlet var addInviteesTableView: UITableView!

    let appdelegateObj = UIApplication.shared.delegate as! AppDelegate
   // var assignnmentViewController = AssignmentDetailViewController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        startParsing()
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addButton.setTitle("Add", for: .normal)
        addButton.showsTouchWhenHighlighted = true
        addButton.setTitleColor(UIColor.blue, for: .normal)
        addButton.addTarget(self,action:#selector(AddClicked),for:.touchUpInside)
        let rightBtn = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = rightBtn


        // Do any additional setup after loading the view.
    }

    func AddClicked(sender:UIButton)
    {
        selectedInviteeArray = [InviteeModel]()
        for  sel in allInviteeArray
        {
           // print (sel.name ,sel.isSelected)
            if(sel.isSelected)
            {
                selectedInviteeArray.append(sel)
            }
        }

appdelegateObj.assignmentDetailViewControllerInAppdelegate.selectedInviteeArrayInSession =       selectedInviteeArray

appdelegateObj.assignmentDetailViewControllerInAppdelegate.selectedInviteeArrayInSession  = [InviteeModel]()
     print (selectedInviteeArray[0].name)
 print(appdelegateObj.assignmentDetailViewControllerInAppdelegate.selectedInviteeArrayInSession)

    self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startParsing()
    {
        let path: NSString = Bundle.main.path(forResource: "AddInvitees", ofType: "json")! as NSString
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSData.ReadingOptions.dataReadingMapped)
        
        //fetching the data from the url
        if let jsonObj = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
        {
            // getting the avengers tag array from json and converting it to NSArray
            if let inviteesArray = jsonObj!.value(forKey: "invitees") as? NSArray
            {
                allInviteeArray = [InviteeModel]()
                
                var inviteeObj = InviteeModel()

                //looping through all the elements
                
                for invitee in inviteesArray {
                    inviteeObj = InviteeModel()
                    //converting the element to a dictionary
                    if let inviteeDict = invitee as? NSDictionary {
                        
                        //getting the name from the dictionary
                        if let id = inviteeDict.value(forKey: "id")
                        {
                            inviteeObj.id = id as! Int
                        }
                        if let name = inviteeDict.value(forKey: "name")
                        {
                            inviteeObj.name = name as! String
                        }
                        if let email = inviteeDict.value(forKey: "email")
                        {
                            inviteeObj.email = email as! String
                        }
                        if let phoneNumber = inviteeDict.value(forKey: "phoneNumber")
                        {
                            inviteeObj.phoneNumber = phoneNumber as! String
                        }
                        if let jobTitle = inviteeDict.value(forKey: "jobTitle")
                        {
                            inviteeObj.jobTitle = jobTitle as! String
                        }
                        allInviteeArray.append(inviteeObj)
                    }
                }
            }
        }
    }



}
    extension AddInviteeViewController : UITableViewDelegate,UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return allInviteeArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddInviteeCell", for: indexPath) as! AddTableViewTableViewCell
            update(cell: cell, inviteeItem: allInviteeArray[indexPath.row])
            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }


        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            allInviteeArray[indexPath.row].isSelected = !allInviteeArray[indexPath.row].isSelected
            addInviteesTableView.reloadData()
        }

        func update(cell: AddTableViewTableViewCell, inviteeItem: InviteeModel) {
            cell.addInviteeNameLabelObj.text = inviteeItem.name
            cell.selectionStyle = .none
            cell.checkMarkImageViewObj.image = inviteeItem.isSelected ? #imageLiteral(resourceName: "EnableCheckBox") : #imageLiteral(resourceName: "EmptyBox")
            cell.backgroundColor = inviteeItem.isSelected ?  UIColor.blue : UIColor.white

        }



}


    

