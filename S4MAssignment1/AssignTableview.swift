//
//  AssignTableview.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 29/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class AssignTableview: UIView ,UITableViewDelegate ,UITableViewDataSource {

var selectedInviteeArrayInSession = [InviteeModel]()

func initializeData(controller: UIViewController,selectedInviteeArrayInSes : InviteeModel)

    {
        self.frame = CGRect (x:0, y:20, width:controller.view.frame.size.width, height:controller.view.frame.size.height)

        let myTableView = UITableView(frame: CGRect(x: 0, y: 0, width:self.bounds.width, height: self.bounds.height))
        self.selectedInviteeArrayInSession = [selectedInviteeArrayInSes]
        
        myTableView.dataSource = self
        myTableView.delegate = self
        self.addSubview(myTableView)
        myTableView.reloadData()
        controller.view.addSubview(self)

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return selectedInviteeArrayInSession.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier:"cell")


        if(cell == nil)
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = selectedInviteeArrayInSession[indexPath.row].name
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
  

}
