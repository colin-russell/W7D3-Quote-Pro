//
//  Photo.swift
//  Quote Pro
//
//  Created by Colin on 2018-05-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit
import Nuke

class Photo: NSObject {
    var image: Image {
        let _ = URL(string: "https://picsum.photos/200/300/?random")!
        let img = UIImage()
        
        return img
    }
}
