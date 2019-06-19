//
//  Item.swift
//  IDLE
//
//  Created by Admin on 14/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import Foundation
import RealmSwift

class Item:Object{
    @objc dynamic var price:Float=0
    @objc dynamic var pps:Float=0
    @objc dynamic var nb:Int=0
    let mult:Float = 1.9
    // return price of the next item
    func nextPrice() -> Float{
        if nb == 0{
            return (Float((nb + 1))*price)
        }
        return (Float((nb + 1))*(price*mult))
    }
    
}

