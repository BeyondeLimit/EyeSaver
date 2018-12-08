//
//  AppDelegate.swift
//  EyeSaver
//
//  Created by Arsenijs Mamikonans on 03/12/2018.
//  Copyright © 2018 Arsenijs Mamikonans. All rights reserved.
//

import Cocoa
import ServiceManagement


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("EyeBarButtonImage"))
            button.action = #selector(printQuote(_:))
        }
        constructMenu()
    }
    @objc func printQuote(_ sender: Any?) {
        let mainStoryboardIpad : NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        let initialViewControlleripad : NSViewController = mainStoryboardIpad.instantiateController(withIdentifier: "Eyes") as! NSViewController
        let window = NSWindow()
        window.contentViewController = initialViewControlleripad
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    func constructMenu() {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Add to startup", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit EyeSaver", action: #selector(NSApplication.terminate(_:)), keyEquivalent: ""))
        statusItem.menu = menu
    }
    
}

