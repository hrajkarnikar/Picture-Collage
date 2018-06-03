//
//  PictureViewController.swift
//  Picture Collage
//
//  Created by bjoshi on 6/2/18.
//  Copyright © 2018 hrajkarnikar. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var FirstImageView: UIImageView!
    @IBOutlet weak var SecondImageView: UIImageView!
    @IBOutlet weak var CombinedImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPicture))
        
        assignTapGesture(imageView: FirstImageView, useGesture: tapGesture)
        assignTapGesture(imageView: SecondImageView, useGesture: tapGesture)
        
        imagePicker.delegate = self

    }
    
    func assignTapGesture(imageView: UIImageView, useGesture: UITapGestureRecognizer) {
        imageView.addGestureRecognizer(useGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc func tapPicture(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            FirstImageView.contentMode = .scaleAspectFit
            FirstImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func joinButtonPressed(_ sender: UIButton) {
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
