//
//  UIImageView+Ext.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 21/02/23.
//

import UIKit

extension UIImageView {
    func loadImage(at url: URL) {
        UIImageLoader.loader.load(url, for: self)
    }
    
    func cancelImageLoad() {
        UIImageLoader.loader.cancel(for: self)
    }
}
