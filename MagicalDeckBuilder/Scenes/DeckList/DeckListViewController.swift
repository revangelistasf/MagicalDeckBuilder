//
//  DeckListViewController.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 17/02/23.
//

import UIKit
import Cartography

protocol DeckListViewControllerProtocol: UIViewController {
    var viewModel: DeckListViewModelProtocol { get }
}

final class DeckListViewController: UIViewController, DeckListViewControllerProtocol {
    // MARK: - View
    private var collectionView: UICollectionView!
    
    // MARK: - Properties
    var viewModel: DeckListViewModelProtocol
    
    // MARK: - Methods
    init(viewModel: DeckListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.configureView()
    }
    
    private func configureView() {
        self.title = viewModel.title
        configureCollectionView()
    }
    
    fileprivate func configureCollectionView() {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.makeThreeColumnFlowLayout()
        )
        self.view.addSubview(collectionView)
        constrain(self.collectionView, self.view) { collectionView, superView in
            collectionView.top == superView.top
            collectionView.leading == superView.leading
            collectionView.trailing == superView.trailing
            collectionView.bottom == superView.bottom
        }
    }
    
    private func makeThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let viewWidth = self.view.bounds.width
        let numberOfColumns: CGFloat = 3
        let numberOfSpacesBetweenColumns = numberOfColumns - 1
        let paddingForCollectionView = Margins.small * 2
        let availableWidth = viewWidth - (numberOfSpacesBetweenColumns * Margins.small) - Margins.small * 2
        let cellWidth = numberOfColumns / availableWidth
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth + 40)
        return flowLayout
    }
}
