//
//  Item.swift
//  IDLE
//
//  Created by Admin on 12/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import Foundation
import RealmSwift


class ItemManager{
    
    let realm = try! Realm()
    
    func initGame(game:Game)  {
        game.setPoint(point: 0)
        game.setPPS(pps: 0)
        game.setClick(click: 1)
        game.setNbClick(nbClick: 1)
        
        let itemOne = Item()
        itemOne.pps = 0.2
        itemOne.nb = 0
        itemOne.price = 10
        game.items.append(itemOne)
        
        let itemTwo = Item()
        itemTwo.pps = 0.5
        itemTwo.nb = 0
        itemTwo.price = 100
        game.items.append(itemTwo)
        
        let itemThree = Item()
        itemThree.pps = 1
        itemThree.nb = 0
        itemThree.price = 1000
        game.items.append(itemThree)
    }
    //try if player have enough point to buy and update data in db
    func buyItem(numItem:Int, game:Game){
        let price = game.items[numItem].nextPrice()
        
        if game.getPoint() >= price{
            try! realm.write{
                game.items[numItem].nb = game.items[numItem].nb+1
                game.buy(price: price)
                game.addPPS(pps: game.items[numItem].pps)
            }
        }
    }
}
