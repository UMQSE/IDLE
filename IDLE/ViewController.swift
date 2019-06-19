//
//  ViewController.swift
//  IDLE
//
//  Created by Admin on 04/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var ig_labelItem: [UITextView]!
    @IBOutlet var ig_btnItem: [UIButton]!
    @IBOutlet weak var ig_btnItemOne: UIButton!
    @IBOutlet weak var ig_btnItemTwo: UIButton!
    @IBOutlet weak var ig_btnItemThree: UIButton!
    @IBOutlet weak var ig_btnUpClick: UIButton!
    
    @IBOutlet weak var ig_labelClick: UILabel!
    @IBOutlet weak var ig_labelItemOne: UITextView!
    @IBOutlet weak var ig_labelItemTwo: UITextView!
    @IBOutlet weak var ig_labelItemThree: UITextView!
    
    @IBOutlet weak var ig_ppsLabel: UILabel!
    @IBOutlet weak var ig_pointLabel: UILabel!
    
    let items = ItemManager()
    var timer:Timer?
    let realm = try! Realm()
    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //reset for test (move to item controller)
        items.initGame(game: game)
        
        //start timer
        time()
        
        // set text of labels
        //for points
        ig_pointLabel.text = "vous avez \(game.getPoint())"
        //for PPS
        ig_ppsLabel.text = "votre PPS est de \(game.getPPS())"
        //for diffrent Items
        for i in ig_labelItem{
            ig_btnItem[i.tag].setTitle(String(format: "price = %.2f", game.items[i.tag].nextPrice()), for: .normal)
            ig_labelItem[i.tag].text = "vous avez :\n \(game.items[i.tag].nb)"
        }
        ig_labelClick.text = String(format: "%.2f", game.nextClickPrice())
    }
    
    // all 1 seconde call function addPoint
    private func time(){
        timer  = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in self.addPPS() })
    }
    
    //add sum of your PPS to your Points
    private func addPPS(){
        try! realm.write {
            game.addPPS()
        }
        refreshPoint()
    }
    
    
    @IBAction func upgradeClick() {
        game.buyClick()
        refreshPPS()
        refreshClick()
    }
    
    @IBAction func btnClick() {
        game.Click()
        refreshPoint()
    }
    //call func to buy an item and refresh of labels
    @IBAction func buyItem(_ sender: UIButton ) {
        items.buyItem(numItem: sender.tag, game: game)
        refreshItem(item: sender.tag)
        refreshPoint()
        refreshPPS()
    }
    
    //refresh Point label
    func refreshPoint() {
        ig_pointLabel.text = "vous avez \(game.getPoint())"
    }
    //refresh PPS label
    func refreshPPS()  {
        ig_ppsLabel.text = "votre PPS est de \(game.getPPS())"
    }
    //refresh Item label
    func refreshItem(item:Int)  {
        for i in ig_btnItem {
            if i.tag == item{
                i.setTitle(String(format: "price = %.2f", game.items[i.tag].nextPrice()), for: .normal)
                ig_labelItem[i.tag].text = "vous avez :\n \(game.items[i.tag].nb)"
            }
        }
    }
    func refreshClick()  {
        ig_labelClick.text = String(format: "%.2f", game.nextClickPrice())
    }
}



