//
//  ViewController.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cell : SessionTableViewCell!
    
    var totalSessionArray = [SessionModel]()
var sectionsArray = [String]()
var dict = Dictionary<String,[SessionModel]>()
    
    
    @IBOutlet var sessionTableObj: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        startParsing()
      // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startParsing()
        
    {
        let path: NSString = Bundle.main.path(forResource: "Sessions", ofType: "json")! as NSString
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSData.ReadingOptions.dataReadingMapped)
        
        //fetching the data from the url
        if let jsonObj = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary {
            
            if let SessionArray = jsonObj!.value(forKey: "Sessions") as? NSArray {
                
                //sessionArray = [SessionModel]()
                
                //looping through all the elements
                
                for everysingleSession in SessionArray
                {
                    
                  var sessionModelObj = SessionModel()
                    
                    var currentDate = ""
                    var currentTime = ""
                    
                    //converting the element to a dictionary
                    if let sessionDict = everysingleSession as? NSDictionary {
                        
                        //getting the name from the dictionary
                        if let ActivityStartDate = sessionDict.value(forKey: "ActivityStartDate")
                        {
                            let activityStartDate = ActivityStartDate as! String
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            let date = dateFormatter.date(from:activityStartDate)!
                            
                            let headerDateFormatter = DateFormatter()
                            headerDateFormatter.dateFormat = "yyyy-MM-dd"
                            headerDateFormatter.timeZone = TimeZone.current
                            let dateStamp = headerDateFormatter.string(from: date)
                            currentDate = headerDateFormatter.string(from: Date())

                            // change to a readable time format and change to local time zone
                            let StartTimeFormatter = DateFormatter()
                            StartTimeFormatter.dateFormat = "hh:mm a"
                            StartTimeFormatter.timeZone = TimeZone.current
                            let startTime = StartTimeFormatter.string(from: date)
                            currentTime = StartTimeFormatter.string(from: Date())

                            sessionModelObj.ActivityDateTime = activityStartDate
                            sessionModelObj.ActivityStartDate = dateStamp
                            sessionModelObj.ActivityStartTime = startTime
                        }
                        
                        if let ActivityEndDate = sessionDict.value(forKey: "ActivityEndDate")
                        {
                            let activityEndDate = ActivityEndDate as! String
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            let date = dateFormatter.date(from:activityEndDate)!
                            
                            let headerDateFormatter = DateFormatter()
                            headerDateFormatter.dateFormat = "yyyy-MM-dd"
                            headerDateFormatter.timeZone = TimeZone.current
                            let dateStamp = headerDateFormatter.string(from: date)
                            
                            // change to a readable time format and change to local time zone
                            let StartTimeFormatter = DateFormatter()
                            StartTimeFormatter.dateFormat = "hh:mm a"
                            StartTimeFormatter.timeZone = TimeZone.current
                            let startTime = StartTimeFormatter.string(from: date)
                            
                            sessionModelObj.ActivityDateTime = activityEndDate
                            sessionModelObj.ActivityEndDate = dateStamp
                            sessionModelObj.ActivityEndTime = startTime
                        }
                        
                        if let Location = sessionDict.value(forKey: "Location")
                        {
                            sessionModelObj.Location = Location as! String
                        }
                        if let Subject = sessionDict.value(forKey: "Subject")
                        {
                            sessionModelObj.Subject = Subject as! String
                        }
                        if let Owner = sessionDict.value(forKey: "Owner")
                        {
                            sessionModelObj.Owner = Owner as! String
                        }
                        if let AccountName = sessionDict.value(forKey: "AccountName")
                        {
                            sessionModelObj.AccountName = AccountName as! String
                        }
                        // getting the avengers tag array from json and converting it to NSArray
                        if let inviteesArray = sessionDict.value(forKey: "invitees") as? NSArray
                        {
                            var allInviteeArray = [InviteeModelinSession]()
                            //looping through all the elements
                            for invitee in inviteesArray
                            {
                               var inviteeObj = InviteeModelinSession()
                                //converting the element to a dictionary
                                if let inviteeDict = invitee as? NSDictionary
                                {
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
                                }
                                allInviteeArray.append(inviteeObj)
                            }
                        }
                        if(currentDate.elementsEqual(sessionModelObj.ActivityStartDate)){
                            if(currentTime <= sessionModelObj.ActivityEndTime){
                                sessionModelObj.IsCurrentOrUpcoming = true
                            }
                        }
//                        sessionModelObj.allInviteeArray=allInviteeArray
                        if !sectionsArray.contains(sessionModelObj.ActivityStartDate){
                            sectionsArray.append(sessionModelObj.ActivityStartDate)
                            var data = [SessionModel]()
                            data.append(sessionModelObj)
                            dict[sessionModelObj.ActivityStartDate] = data
                        }else{
                            var data = dict[sessionModelObj.ActivityStartDate]
                            data?.append(sessionModelObj)
                            dict.removeValue(forKey: sessionModelObj.ActivityStartDate)
                            dict[sessionModelObj.ActivityStartDate] = data
                        }
                    }
                }
                print(dict)
            }
        }
        
        //sort section array
        sectionsArray = sectionsArray.sorted(by: <)
        sessionTableObj.reloadData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableview delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionData = dict[sectionsArray[indexPath.section]]
        let rowData = sectionData![indexPath.row]
        if rowData.IsCurrentOrUpcoming{
            return 160
        }
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        let data = dict[sectionsArray[section]]
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:sectionsArray[section])!
        // change to a readable time format and change to local time zone
        let headerDateFormatter = DateFormatter()
        headerDateFormatter.dateFormat = "MMM d, yyyy"
        headerDateFormatter.timeZone = TimeZone.current
        let dateStamp = headerDateFormatter.string(from: date)
        return dateStamp.description
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        cell  = tableView.dequeueReusableCell(withIdentifier: "IdentifierSessionVCCell") as! SessionTableViewCell
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("IdentifierSessionVCCell", owner: self, options: nil)?[0] as! SessionTableViewCell;
        }
        let sectionData = dict[sectionsArray[indexPath.section]]
        let rowData = sectionData![indexPath.row]
        //////loading sessions information in listview/////
        cell.subjectLabelObj.text = rowData.Subject
        cell.locationLabelObj.text=rowData.Location
        cell.startAndEndDateLabelObj.text = rowData.ActivityStartTime + "-" + rowData.ActivityEndTime
        cell.ongoingSessionTimeLabelObj.text = rowData.ActivityStartTime
        cell.ownerNameLabelObj.text = rowData.Owner
        cell.accountNameLabelObj.text = rowData.AccountName
        cell.initialNmaeLabelObj.text = rowData.Owner.getAcronyms()
        
        //check start date is equals to todays date
        if rowData.IsCurrentOrUpcoming{
            cell.superViewOfCell.backgroundColor = UIColor.blue
            cell.timeDispView.backgroundColor = UIColor.blue
            cell.ongoingSessionTimeLabelObj.textColor = UIColor.white
            cell.topView.isHidden = false
            cell.topViewHeightC.constant = 76

        }else{
            cell.superViewOfCell.backgroundColor = UIColor.darkGray
            cell.timeDispView.backgroundColor = UIColor.white
            cell.ongoingSessionTimeLabelObj.textColor = UIColor.black
            cell.topView.isHidden = true
            cell.topViewHeightC.constant = 0

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailSessionViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailSessionViewController") as! DetailScreenViewController
        self.navigationController?.pushViewController(detailSessionViewController, animated: true)
    }
}

extension String
{
    public func getAcronyms(separator: String = "") -> String
    {
        let acronyms = self.components(separatedBy: " ").map({ String($0.characters.first!) }).joined(separator: separator)
        return acronyms.uppercased()
    }
}

