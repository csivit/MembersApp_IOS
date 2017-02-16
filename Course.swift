//
//  Course.swift
//  Developers Academy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import UIKit

class Course
{
    var title = ""
    var description = ""
    var image: UIImage!
    var programURL = ""
    
    init(title: String, description: String, image: UIImage, programURL: String)
    {
        self.title = title
        self.description = description
        self.image = image
        self.programURL = programURL
    }
}
