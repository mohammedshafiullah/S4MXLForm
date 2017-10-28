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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        startParsing()

        // Do any additional setup after loading the view.
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
    
    
    /////Tableview Delegates//////
    
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return allInviteeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        cell  = tableView.dequeueReusableCell(withIdentifier: "AddInviteeCell") as! AddTableViewTableViewCell
        
        if(cell == nil)
            
        {
            cell = Bundle.main.loadNibNamed("AddInviteeCell", owner: self, options: nil)?[0] as! AddTableViewTableViewCell;
            
        }
        cell.inviteeName.text = self.allInviteeArray[indexPath.row].name as String
        
         //  cell!.checkMarkButtonInvitees.imageView?.image = UIImage(named: "")
      
        return cell as AddTableViewTableViewCell
    }
    
    
    
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
 {
   //inviteeCheck.png
    //let cell = tableView.cellForRow(at: indexPath) as! AddTableViewTableViewCell
    
    selectedInviteeArray.append(allInviteeArray[indexPath.row])
    
    
}

    @IBAction func addInviteeAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
        let detailScreenViewc = DetailScreenViewController ()
        
        //detailScreenViewc.addInviteeViewCC.allInviteeArray  = selectedInviteeArray
        
        

    }
    
    
    
}
