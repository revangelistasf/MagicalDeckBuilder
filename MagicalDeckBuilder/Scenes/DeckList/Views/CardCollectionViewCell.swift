//
//  CardCollectionViewCell.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 19/02/23.
//

import UIKit
import Cartography

class CardCollectionViewCell: UICollectionViewCell {
    var cardImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    static let identifier = String(describing: CardCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cardImageView)
        constrain(cardImageView, contentView) { imageView, superView in
            imageView.top == superView.top
            imageView.leading == superView.leading
            imageView.trailing == superView.trailing
            imageView.bottom == superView.bottom
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
