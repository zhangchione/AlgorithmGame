//
//  AlCentCell.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/18.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import RealmSwift

class AlCentCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
        let dataArray = ["1","2","3","4","5","6","7","8","9","10","1","2","3","4","5","6","7","8","9","10"]
    let realm = try! Realm()
    var itemArray: Results<Item>?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                itemArray = realm.objects(Item.self)
        return itemArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlCollectionCell", for: indexPath) as! AlCollectionCell
        //cell.dataString = self.dataArray[indexPath.row]
        cell.Tnumber.text = dataArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.FitHeight, height: 80.FitHeight)
    }
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.register(UINib(nibName: "AlCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AlCollectionCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
