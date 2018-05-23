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
        
        loadRandomQuote()
        
    }

    func setupQuoteView() {
        quoteView.setupWithQuote(quote: quote)
        quoteView.translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: quoteView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.5, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: quoteView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: quoteView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: quoteView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100)
        self.view.addConstraints([heightConstraint, leftConstraint, rightConstraint, topConstraint])

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
    
    func saveViewImage() {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { ctx in
            quoteView.drawHierarchy(in: quoteView.bounds, afterScreenUpdates: true)
        }
        quote.quoteImage = image
    }
    
    //MARK: Actions
    
    @IBAction func randomImageButtonPressed(_ sender: UIButton) {
        //loadRandomImage()
    }
    
    @IBAction func randomQuoteButtonPressed(_ sender: UIButton) {
        loadRandomQuote()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        saveViewImage()
        delegate?.didfinishSaving(quote: quote)
        self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelQuoteSave(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
    }
    
}
