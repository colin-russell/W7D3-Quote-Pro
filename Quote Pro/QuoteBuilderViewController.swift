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
    @IBOutlet weak var quoteTextLabel: UILabel!
    @IBOutlet weak var quoteAuthorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRandomImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadRandomImage() {
//        let photo = Photo()
        let url = URL(string: "https://picsum.photos/200/300/?random")!
        Manager.shared.loadImage(with: url, into: quoteImageView)
        
    }
    
    //MARK: Actions
    
    @IBAction func randomImageButtonPressed(_ sender: UIButton) {
        loadRandomImage()
    }
    
    @IBAction func randomQuoteButtonPressed(_ sender: UIButton) {
        let q = Quote()
        q.getRandomQuote { () in
            DispatchQueue.main.async {
                self.quoteTextLabel.text = q.quoteText
                self.quoteAuthorLabel.text = q.quoteAuthor
            }
        }
        
    }
    
    
    @IBAction func cancelQuoteSave(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
