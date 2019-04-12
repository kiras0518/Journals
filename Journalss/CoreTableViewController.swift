//
//  CoreTableViewController.swift
//  Journalss
//
//  Created by YU on 2019/4/12.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class CoreTableViewController: UITableViewController {
    
    @IBOutlet var noteTableView: UITableView!
    
    //CoreData type
    var listNote: [Notes]? = nil
    var selectedIndexPath: IndexPath?
    
    @IBAction func buttonCreateNote(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "toCreate", sender: Any?.self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShow" {
            if let createVC = segue.destination as? CreateNoteViewController {
                print("toSHOW")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("listNote",listNote)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.listNote = CoreDataHandler().getNotesList()
        self.noteTableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.listNote?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "core_cell", for: indexPath) as? CoreTableViewCell {
            cell.notesTitle.text = self.listNote?[indexPath.row].title
            print("cell",listNote?[indexPath.row] as Any)
           
            return cell
        }
        return UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
