//
//  HPDataSource.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 10/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
typealias CompletionHandler = (() -> Void)

class ChampDataSource: NSObject, UICollectionViewDataSource{
    var imageGlobal: UIImageView!
    var champList: ChampList{
        didSet{
            self.Notify()
        }
    }
    public var observers: CompletionHandler?
    
    init(object: ChampList){
        self.champList = object
    }
    
    public func addObserver(_ observer:NSObject, completionHandler: @escaping CompletionHandler){
        observers = completionHandler
    }
    
    public func Notify(){
        observers?()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return champList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChampCell", for: indexPath) as! CollectionViewCell
        
        let char = champList[indexPath.row]
        
        cell.champName.text = char.name
        if let champCost = char.cost{
            cell.champCost.text = String(champCost)
        } else {
            cell.champCost.text = "";
        }
//        if let filePath = (char.image){
//
//            cell.charImage.contentMode = .scaleAspectFit
//
//            if let url = URL(string: filePath){
//                do{
//                    let imageData = try Data(contentsOf: url)
//                    cell.charImage.image = UIImage(data: imageData)
//                    cell.layer.shouldRasterize = true
//                    cell.layer.rasterizationScale = UIScreen.main.scale
//                }
//                catch let error{
//                    print("Erro \(error.localizedDescription)")
//                }
//
//            }
//        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}



