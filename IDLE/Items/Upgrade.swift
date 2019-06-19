//
//  Upgrade.swift
//  IDLE
//
//  Created by Admin on 19/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import Foundation
import RealmSwift

class Upgrade:Object {
    private var name:String = ""
    private var item:Item? = nil
    private var pointNeed:Float = 0.0
    private var itemNeed:Int = 0
    private var buy:Bool = false
    private var price:Float = 0.0
    private var newPPS:Float = 0.0
    
   func create(name:String, item:Item, pointNeed:Float, itemNeed:Int, price:Float, newPPS:Float){
        self.name = name
        self.item = item
        self.pointNeed = pointNeed
        self.itemNeed = itemNeed
        self.price = price
        self.newPPS = newPPS
    }
   
}
