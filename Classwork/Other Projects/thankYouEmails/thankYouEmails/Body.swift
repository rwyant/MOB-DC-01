//
//  Body.swift
//  thankYouEmails
//
//  Created by Rob Wyant on 1/15/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import Foundation

class Body {
    var name: String = ""
    var email: String = ""
    var school:String = ""
    func generateEmail () -> String {
        return "Hello\( name)," +
        "Thank you for downloading Yapper." +
        "Regards," +
        "The Yapper Team"
    }
}