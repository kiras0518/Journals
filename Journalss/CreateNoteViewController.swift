//
//  CreateNoteViewController.swift
//  Journalss
//
//  Created by YU on 2019/4/12.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var imageTouch: UIButton!
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var noteTitle: UITextView!
    @IBOutlet weak var noteContent: UITextView!
    
    var imageUrl = ""
    var imagePicker = UIImagePickerController()
    var handler = CoreDataHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        let touch = UITapGestureRecognizer(target: self, action: #selector(onImageTouch(tap:)))
        // Do any additional setup after loading the view.
    }

    
    func validateNotes() -> Bool {
        if self.imageUrl != "" && noteTitle.text != "" &&
            noteContent.text != "Enter your note" {
            return true;
        }else{
            return false
        }
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        let notes = NoteModel.init(title: titleText.text!, content: noteContent.text!, image: self.imageUrl)
        handler.createNotes(helper: notes)
        //self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        openPicker()
        print("addPhoto")
    }

    @objc func onImageTouch(tap: UITapGestureRecognizer) {
        openPicker()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            self.imagePhoto.image = selectedImage
        }
        //取得照片後將imagePickercontroller dismiss
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func openPicker() {
        let alert = UIAlertController(title: "Select", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (view) in
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                print("can't open camera library"); return
            }
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Library", style: .default, handler: { (view) in
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                print("can't open photo library"); return
            }
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
