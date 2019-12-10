//
//  HPViewModel.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 10/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ChampViewModel{
    
    private var champService: ChampionService
    var champSource: ChampDataSource
    
    init(service: ChampionService, source: ChampDataSource){
        champService = service
        champSource = source
        
    }
    
    
    func fetchChamp(){
        champService.ChampAPI(completion:{ chars, errorMessage in
            DispatchQueue.main.async {
                self.champSource.champList = chars ?? []
            }
        })
    }
    
//    func getEntity(){
//
//        champSource.champList.forEach {
//            let champ: Champ = CoreDataStack.getEntity()
//            char.nameData = $0.name
//            char.imageData = $0.image
//            char.actorData = $0.actor
//            char.dateOfBirthData = $0.dateOfBirth
//            char.houseData = $0.house
//            char.ancestryData = $0.ancestry
//
//            CoreDataStack.saveContext()
//
//        }
//        func fetchEntity(){
//
//        }
//
//    }
}
