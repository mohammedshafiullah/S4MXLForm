//
//  DetailScreenViewController.swift
//  S4MAssignment1
//
//  Created by Developer on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit


class DetailScreenViewController: UIViewController
{
    

    @IBOutlet var detailSessionTableViewObj: UITableView!
    
    
    @IBOutlet var detailScreenScrollViewObj: UIScrollView!
    
    @IBOutlet var inviteeTableViewObj: UITableView!
    
    
    @IBOutlet var Viewheight: NSLayoutConstraint!
    @IBOutlet var detailScreenScrollViewsChildView: UIView!
    
    
    var inviteeBoolean = false
    
    @IBOutlet var headerTittleLabelObj: UILabel!
    var location = ["Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai","Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai","Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai"]
    
    var accountNmae = ["Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation","Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation","Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation"]
    
    
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        /////Data from AddInviteeController//
        
        let addInviteeViewCC = AddInviteeViewController ()
        
        addInviteeViewCC.allInviteeArray = [InviteeModel]()
        
        
        inviteeBoolean = false
        detailSessionTableViewObj.register(InviteesListTableViewCell.self, forCellReuseIdentifier: "CellIN")
        inviteeTableViewObj.register(DetailScreenTableViewCell.self, forCellReuseIdentifier: "CellD")


        // Do any additional setup after loading the view.
    }
   
    
    override func viewDidLayoutSubviews()
    {
      scrollViewContentSize ()
    }
    
        func scrollViewContentSize ()
    {
    
        detailScreenScrollViewObj.contentSize = CGSize(width: self.view.frame.size.width, height: 1000 )
        
        Viewheight.constant = detailScreenScrollViewObj.contentSize.height
        
        
        
    }
    

    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func inviteeButtonAction(_ sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editButtonAction(_ sender: UIButton)
        
    {
        inviteeBoolean = true
        
        let addInviteeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddInviteeViewController") as! AddInviteeViewController
        
        self.navigationController?.pushViewController(addInviteeViewController, animated: true)
        
    }

    
    //IdnfrInviteesCell
  //  IdnfrDetailSessionCell
    
    //tableview delegate
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        
        if (inviteeBoolean)
        {
        return location.count
        }
        else
        {
            return accountNmae.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        if (!inviteeBoolean)
        {
            var inviteeCell : InviteesListTableViewCell! =  tableView.dequeueReusableCell(withIdentifier: "CellIN", for:indexPath) as! InviteesListTableViewCell

           if(inviteeCell == nil)
            {
                inviteeCell = Bundle.main.loadNibNamed("CellIN", owner: self, options: nil)?[0] as! InviteesListTableViewCell;
            }
            return inviteeCell as InviteesListTableViewCell
        }
        else
        {
             var detailScnCell : DetailScreenTableViewCell! =  tableView.dequeueReusableCell(withIdentifier: "CellD", for:indexPath) as! DetailScreenTableViewCell
            
            if(detailScnCell == nil)
            {
                detailScnCell = Bundle.main.loadNibNamed("CellD", owner: self, options: nil)?[0] as! DetailScreenTableViewCell;
            }
            return detailScnCell as DetailScreenTableViewCell

        }
        
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView)
        {
            
     detailScreenScrollViewObj.contentSize = CGSize(width: self.view.frame.size.width, height: 1000 )
            
    Viewheight.constant = detailScreenScrollViewObj.contentSize.height
    }

   
    @IBAction func addInviteeAction(_ sender: UIButton)
    {
        let addInviteeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddInviteeViewController") as! AddInviteeViewController
        self.navigationController?.pushViewController(addInviteeViewController, animated: true)
    }
    
    
       
}
