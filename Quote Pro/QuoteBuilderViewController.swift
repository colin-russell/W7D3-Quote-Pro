//
//  QuoteBuilderViewController.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit
import Nuke

protocol QuoteBuilderDelegate: class {
    func didfinishSaving(quote: Quote)
}


class QuoteBuilderViewController: UIViewController {
    
    let quote = Quote()
    var quoteView = QuoteView()
    weak var delegate: QuoteBuilderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let objects = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: [:]),
            let qView = objects.first as? QuoteView {
            self.view.addSubview(qView)
            self.quoteView = qView
        }
        //setupQuoteView()
        loadRandomQuote()
        loadRandomImage()
    }

    func setupQuoteView() {
        //quote.generateQuote()
        quoteView.setupWithQuote(quote: quote)
        quoteView.frame = CGRect(x: 20, y: 20, width: self.view.bounds.width - 20 , height: 400)
    }
    
    func loadRandomQuote() {
        let networkManger = NetworkManager()
        networkManger.getRandomQuote { (text, author) in
            DispatchQueue.main.async {
                self.quote.quoteText = text
                self.quote.quoteAuthor = author
                self.setupQuoteView()
            }
        }
        
    }
    
    func loadRandomImage() {
//        let photo = Photo()
        //let url = URL(string: "https://picsum.photos/200/300/?random")!
        //Manager.shared.loadImage(with: url, into: )
        
    }
    
    //MARK: Actions
    
    @IBAction func randomImageButtonPressed(_ sender: UIButton) {
        //loadRandomImage()
    }
    
    @IBAction func randomQuoteButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.didfinishSaving(quote: quote)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelQuoteSave(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
