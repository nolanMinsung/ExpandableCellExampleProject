//
//  CollectionView.swift
//  ExpandableCellExample
//
//  Created by 김민성 on 4/12/25.
//

import UIKit

import ExpandableCell

final class MyCollectionView: ExpandableCellCollectionView {
    
    init() {
        super.init(sectionInsetInVertical: 20, horizontal: 20, minimumLineSpacing: 20)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/// If you need to implement additional behavior related to `UICollectionViewDelegate` or `UIScrollViewDelegate`, subclass `ExpandableCellCollectionView` and implement the appropriate delegate methods.
extension MyCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: ExpandableCell, forItemAt indexPath: IndexPath) {
        print("will Display \(indexPath)")
    }
    
    override func collectionView(_ collectionView: ExpandableCellCollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyExpandableCell else { return false }
        print("unfolding [\(cell.titleLabel.text!)]")
        return true
    }
    
    override func collectionView(_ collectionView: ExpandableCellCollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyExpandableCell else { return false }
        print("folding [\(cell.titleLabel.text!)]")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView did Select at \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("collectinoView did Deselect at \(indexPath)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView did scroll: \(scrollView.contentOffset)")
    }
    
}

