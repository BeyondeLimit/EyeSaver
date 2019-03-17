//
//  ViewController.swift
//  asddas
//
//  Created by Arsenijs Mamikonans on 05/12/2018.
//  Copyright © 2018 Arsenijs Mamikonans. All rights reserved.
//

import Cocoa
class EyeSaverVC: NSViewController {
    
    @IBOutlet weak var timePopUp: NSPopUpButton!
    private var vm = EyeSaverVM()
    
    var observe: NSKeyValueObservation?
    override func viewDidLoad() {
        super.viewDidLoad()
        timePopUp.addItems(withTitles: ["1 minutes", "5 minutes", "10 minutes","15 minutes", "20 minutes","test"])
        observe = vm.observe(\EyeSaverVM.change, options: .new) { (vm, change) in
            NSApplication.shared.unhide(nil)
        }
        
    }
    
    override func viewDidAppear() {
    self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
        view.window?.level = .floating
    }
    
    @IBAction func dismissPressed(_ sender: Any) {
        NSApplication.shared.hide(nil)
        vm.waitTillPopup(timePopUp.indexOfSelectedItem)
    }
    
    
}

