//
//  ViewController.swift
//  TFTzin
//
//  Created by Erich Diniz on 28/11/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class ChampViewController: UIViewController  {
    
   

    @IBOutlet weak var collectionView: UICollectionView!
   
    let source = ChampDataSource(object: [])
    var selectedCell = 0
    let service = ChampionService()
    
    lazy var viewModel = ChampViewModel(service: service, source: source
    
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //if you use xibs:
        
 
        collectionView.delegate = self as? UICollectionViewDelegate
        collectionView.dataSource = source
        
        
    self.collectionView.register(UINib(nibName:"CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ChampCell")
        source.addObserver(self){
            self.collectionView.reloadData()
        }
        
        viewModel.fetchChamp()
    }


    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
//
//        //in this example I added a label named "title" into the MyCollectionCell class
//        cell.name.text = self.objects[indexPath.row]
//        return cell
//    }
}


extension ChampViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        
    {
        selectedCell = indexPath.row
        print(selectedCell)
        
    }
}
