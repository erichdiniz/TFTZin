//
//  ChampionService.swift
//  TFTzin
//
//  Created by Erich Diniz on 02/12/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class ChampionService {

    init(){
        
    }

    let url = URL(string: "https://cdn.jsdelivr.net/gh/Feirell/teamfight-tactics-data/champions.json")!
    
    let session = URLSession.shared
    
    func ChampAPI(completion: @escaping (_ chars: ChampList?, _ errorMessage: String?) -> Void){
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            
            guard error == nil else{
                completion(nil, "error")
                return
            }
            
            guard let data = data else {
                completion(nil, "data error")
                return
            }
            
            do{
                let decodedObject = try JSONDecoder().decode(ChampList.self, from:data)
                print(decodedObject)
                
                completion(decodedObject, nil)
            } catch let error {
                completion(nil, "error")
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
}
enum Result<T>{
    case Success(T)
    case Error(String)
}
