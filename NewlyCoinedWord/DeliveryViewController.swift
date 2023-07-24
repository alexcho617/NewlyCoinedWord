//
//  DeliveryViewController.swift
//  NewlyCoinedWord
//
//  Created by Alex Cho on 2023/07/22.
//

import UIKit

class DeliveryViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(image.isUserInteractionEnabled)
        image.isUserInteractionEnabled = true
        print(image.isUserInteractionEnabled)
    }

    @IBAction func image(_ sender: UITapGestureRecognizer) {
        print("image")
    }
    
    @IBAction func innerImage(_ sender: UITapGestureRecognizer) {
        print("inner Image")
    }
    @IBAction func superView(_ sender: UITapGestureRecognizer) {
        print("Superview")
    }
    
}
