//
//  CoreData.swift
//  Journalss
//
//  Created by YU on 2019/4/12.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler {
    
    private func getContext() -> NSManagedObjectContext {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        return appdelegate.persistentContainer.viewContext
    }
    
    func createNotes(helper: NoteModel) {
        
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(helper.title, forKey: "title")
        managedObject.setValue(helper.content, forKey: "content")
        managedObject.setValue(helper.image, forKey: "imageData")
        
        do {
            try context.save()
            print("managedObject",helper.title, helper.content, helper.image)
        } catch  {
            print("Error creating notes")
        }
    }
    
    func removeNotes() {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)

        do {
            try context.delete(managedObject)
        } catch {
            print(error)
        }
    }
    
    func getNotesList() -> [Notes] {
        let context = getContext()
        var notes: [Notes]? = nil
        do {
            notes = try context.fetch(Notes.fetchRequest())
        } catch {
            print(error)
        }
        return notes!
    }
    
}
