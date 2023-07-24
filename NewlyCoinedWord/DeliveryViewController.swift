//
//  DeliveryViewController.swift
//  NewlyCoinedWord
//
//  Created by Alex Cho on 2023/07/22.
//

import UIKit

class DeliveryViewController: UIViewController {

    @IBOutlet var firstImage: UIImageView!
    
    @IBOutlet var secondImage: UIImageView!
    
    @IBOutlet var thirdImage: UIImageView!
    
    @IBOutlet var firstLabel: UILabel!
    
    @IBOutlet var secondLabel: UILabel!
    
    @IBOutlet var thirdLabel: UILabel!
    
    @IBOutlet var firstButton: UIButton!
    
    @IBOutlet var secondButton: UIButton!
    
    @IBOutlet var thirdButton: UIButton!
    
    let lyrics = ["HI Its me", "Hello its just me", "Hey its me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(firstImage.isUserInteractionEnabled)
        firstImage.isUserInteractionEnabled = true
        print(firstImage.isUserInteractionEnabled)
    }

    @IBAction func superviewTap(_ sender: UITapGestureRecognizer) {
//        firstImage.isHidden = !firstImage.isHidden
//        firstImage.isHidden.toggle()
        firstImage.isHidden = firstImage.isHidden == true ? false : true
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        print(lyrics[sender.tag - 1])
    }
    
    
    
}
