//
//  Contact.swift
//  ContactBook
//
//  Created by Abylbek Khassenov on 9/24/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import Foundation
import  UIKit
class Contact{
    var name_Surname :String?
    var phone_Number: String?
    var image : UIImage?
    init(_ name_Surname : String ,_ phone_Number : String ,_ image : UIImage) {
        self.name_Surname = name_Surname
        self.phone_Number = phone_Number
        self.image = image
    }
}
