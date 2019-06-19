//
//  UpgradeManager.swift
//  IDLE
//
//  Created by Admin on 19/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import Foundation
import RealmSwift

class UpgradeManager{

    func initUpgrade(game:Game) {
        let upOne = Upgrade()
        upOne.create(name: "Item 1 ↑", item: game.items[0], pointNeed: 6000, itemNeed: 10, price: 10000, newPPS: 0.4)
        let upTwo = Upgrade()
        upTwo.create(name: "Item 1 ↑", item: game.items[0], pointNeed: 6000, itemNeed: 10, price: 10000, newPPS: 0.4)
        let upThree = Upgrade()
        upThree.create(name: "Item 1 ↑", item: game.items[0], pointNeed: 6000, itemNeed: 10, price: 10000, newPPS: 0.4)
    }
    
}
