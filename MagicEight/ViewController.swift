//
//  ViewController.swift
//  MagicEight
//
//  Created by mac on 12/2/15.
//  Copyright © 2015 JY. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var nameTextFiled: NSTextField!
  @IBOutlet weak var adviceLabel: NSTextField!
  @IBOutlet weak var welcomLabel: NSTextField!
  @IBOutlet weak var ballImageView: NSImageView!
  @IBOutlet weak var welcomButton: NSButton!
  
  let adviceList = [
    "Yes",
    "No",
    "Say 'do it'",
    "Maybe",
    "Try again later",
    "How can I konw?",
    "Totally",
    "Never"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    adviceLabel.hidden = true
    ballImageView.image = NSImage(named: "8ball")
  }
  @IBAction func welcomBtnClicked(sender: AnyObject) {
    welcomLabel.stringValue = "Hello \(nameTextFiled.stringValue)!"
  }
  
  @IBAction func handleBallClick(sender: AnyObject) {
    if adviceLabel.hidden {
      
      if let advice = adviceList.randomElement {
        adviceLabel.stringValue = advice
        adviceLabel.hidden = false
        ballImageView.image = NSImage(named: "magic8ball")
      }
      
    } else {
      
      adviceLabel.hidden = true
      ballImageView.image = NSImage(named: "8ball")
      
    }
  }
  
  
  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }
}

extension Array {
  var randomElement: Element? {
    if count < 1 {return .None}
    let randomIndex = arc4random_uniform(UInt32(count))
    return self[Int(randomIndex)]
  }
}

