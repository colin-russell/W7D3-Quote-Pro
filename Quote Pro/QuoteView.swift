//
//  QuoteView.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit
import Nuke

class QuoteView: UIView {

    @IBOutlet weak var quoteTextLabel: UILabel!
    @IBOutlet weak var quoteAuthorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setupWithQuote(quote: Quote) {
        quoteTextLabel.text = quote.quoteText
        quoteAuthorLabel.text = quote.quoteAuthor
        Manager.shared.loadImage(with: URL(string: "https://picsum.photos/200/300/?random")!, into: imageView)
    }
    
}
