//
//  ViewController.swift
//  Picture Collage
//
//  Created by bjoshi on 6/2/18.
//  Copyright © 2018 hrajkarnikar. All rights reserved.
//

import UIKit

class FrameViewController: UIViewController {

    @IBOutlet weak var frameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let destinationVC = segue.destination as! PictureViewController
    }
    
    
    @IBAction func frameButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "selectPictures", sender: self)
    }
    

}

