//
//  CollectionViewController.swift
//  SwiftyDequeuableExample
//
//  Created by Alex Nguyen on 2017-08-19.
//  Copyright © 2017 Gopher Labs LTD. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(SimpleCollectionViewCell.self)
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(SimpleCollectionViewCell.self, forIndexPath: indexPath)
        cell.label.text = "\(indexPath.row)"
        return cell
    }
}
