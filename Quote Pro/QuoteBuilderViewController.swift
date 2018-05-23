//
//  QuoteBuilderViewController.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit
import Nuke

class QuoteBuilderViewController: UIViewController {

    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRandomImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadRandomImage() {
        let photo = Photo()
        quoteImageView.image = photo.image
        
        
    }
    
    //MARK: Actions
    
    @IBAction func randomImageButtonPressed(_ sender: UIButton) {
        loadRandomImage()
    }
    
    @IBAction func cancelQuoteSave(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
