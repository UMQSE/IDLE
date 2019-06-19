//
//  UserData.swift
//  IDLE
//
//  Created by Admin on 12/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import Foundation
import RealmSwift

class Game:Object {
    @objc private dynamic var pps:Float = 1
    @objc private dynamic var point:Float = 0
    @objc private dynamic var click:Float = 1
    @objc private dynamic var nbClick:Int = 1
    @objc private dynamic var priceClick:Float = 5.6
    @objc private dynamic var ppsClick:Float = 0.1
    
    let items = List<Item>()
    let upgrades = List<Upgrade>()
    
    
 /* var itemTabInt: [Int] {
        return itemTab.map({ (number) -> Int in
            return Int(truncating: number)
        })
    }
    */
   
    func getPPS() -> Float {
        return pps
    }
    func getPoint() -> Float {
        return point
    }
    func setPPS(pps:Float) {
        self.pps = pps
    }
    func setPoint(point:Float) {
        self.point = point
    }
    func setClick(click:Float){
        self.click=click
    }
    func setNbClick(nbClick:Int){
        self.nbClick = nbClick
    }
    func addPPS(pps:Float) {
        self.pps = self.pps + pps
    }
    func addPPS() {
        self.point = self.point + self.pps
    }
    func buy(price:Float){
        point = point - price
    }
    func nextClickPrice() -> Float {
        return (Float((nbClick))*priceClick)
    }
    func buyClick(){
        if point>=nextClickPrice() {
            buy(price: nextClickPrice())
            pps = pps+ppsClick
            nbClick = nbClick+1
            click = click+ppsClick
        }
    }
    func Click(){
        point = point+click
    }
    
    
    
}

