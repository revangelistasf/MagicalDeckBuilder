//
//  CardCollectionViewCell.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 19/02/23.
//

import UIKit
import Cartography

struct CardCollectionViewModel {
    let imageUrlString: String
}

class CardCollectionViewCell: UICollectionViewCell {
    var cardImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var onReuse: () -> Void = { }
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cardImageView.image = nil
        self.cardImageView.contentMode = .scaleAspectFit
        self.cardImageView.cancelImageLoad()
    }
    
    func setupCell(with viewModel: CardCollectionViewModel) {
        if let imageUrl = URL(string: viewModel.imageUrlString) {
            self.cardImageView.loadImage(at: imageUrl)
        } else {
            self.cardImageView.image = UIImage(systemName: "photo.fill")!
            self.cardImageView.contentMode = .center
        }
        
    }
}
