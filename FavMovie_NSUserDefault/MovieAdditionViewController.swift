//
//  MovieViewController.swift
//  FavMovie_NSUserDefault
//
//  Created by Younoussa Ousmane Abdou on 7/12/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class MovieAdditionViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var newMovieObj: Movie?
    
    @IBOutlet weak var newMovieTitle: UITextField!
    @IBOutlet weak var newMovieDesc: UITextField!
    @IBOutlet weak var newMovieImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        
        if let title = newMovieTitle.text, let desc = newMovieDesc.text {
            
            let movie = Movie(title: title, desc: desc, image: nil)
            
            DataService.instance.addMovie(movie)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        newMovieTitle.delegate = self
        newMovieDesc.delegate = self
    }
    
    // TextField
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        newMovieTitle.resignFirstResponder()
        newMovieDesc.resignFirstResponder()
        
        return true
    }
    
    // ImagePickerController
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        newMovieImageView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            
            let title = newMovieTitle.text ?? ""
            let desc = newMovieDesc.text ?? ""
            let image = newMovieImageView.image
            
            newMovieObj = Movie(title: title, desc: desc, image: image)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
