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
    let imageLoader = ImageLoader()
    
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
        self.viewModel.viewDelegate = self
        self.viewModel.start()
    }
    
    private func configureView() {
        self.title = viewModel.title
        self.configureCollectionView()
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
        
        self.collectionView.dataSource = self
        self.collectionView.register(
            CardCollectionViewCell.self,
            forCellWithReuseIdentifier: CardCollectionViewCell.identifier
        )
    }
    
    private func makeThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let viewWidth = self.view.bounds.width
        let numberOfColumns = 3.0
        let numberOfSpacesBetweenColumns = numberOfColumns - 1
        let availableWidth = viewWidth - (numberOfSpacesBetweenColumns * Margin.small) - Margin.small * 2
        let cellWidth = availableWidth / numberOfColumns
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth + 40)
        return flowLayout
    }
}

extension DeckListViewController: DeckListViewModelDelegate {
    func reloadData() {
        self.collectionView.reloadData()
    }
}

extension DeckListViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.cards.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cardCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCollectionViewCell.identifier,
            for: indexPath
        ) as! CardCollectionViewCell
        
        cardCollectionViewCell.setupCell(with: viewModel.cardViewModel(at: indexPath))
        return cardCollectionViewCell
    }
}
