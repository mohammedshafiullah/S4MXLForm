//
//  SessionModel.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 26/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import Foundation

class SessionModel: NSObject
{
    internal var SessionId = Int()
    internal var ActivityStartDateTime = String()
    internal var ActivityEndDateTime = String()

    internal var ActivityStartDate = String()
    internal var ActivityEndDate = String()
    internal var ActivityStartTime = String()
    internal var ActivityEndTime = String()
    internal var PrimaryContactName = String()
    internal var JobTitle = String()
    internal var Location = String()
    internal var Subject = String()
    internal var Owner = String()
    internal var AccountName = String()
    internal var ActivityType = String()
    internal var OpportunityName = String()
    internal var LeadName = String()
    internal var Description = String()    
    internal var IsCurrentOrUpcoming = Bool()


    
    
    
    

    
    /**
     Default Constructor
     - returns: nil
     */
    override init()
    {
        
    }
    
    /**
     Mapping Response keys to variables
     - parameter map: Map
     */
    
}

class InviteeModelinSession: NSObject
{
    internal var id = Int()
    internal var name = String()
    internal var email = String()
    internal var phoneNumber = String()
    internal var jobTitle = String()
    
    
    /**
     Default Constructor
     - returns: nil
     */
    override init()
    {
        
    }
    
    /**
     Mapping Response keys to variables
     - parameter map: Map
     */
    
}
