//
//  NoteModel.swift
//  Journalss
//
//  Created by YU on 2019/4/12.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit
import CoreData

struct NoteModel {
    
    let title: String
    let content: String
    let image: String?

    init(title: String, content: String, image: String) {
        self.title = title
        self.content = content
        self.image = image
    }
}


//extension Notes {
//    convenience init(title: String, content: String, imageData: String, context: NSManagedObjectContext) {
//
//        self.init(context: context)
//
//        self.title = title
//        self.content = content
//        self.imageData = imageData
//    }
//}
