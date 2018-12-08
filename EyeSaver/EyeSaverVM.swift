//
//  EyeSaverVM.swift
//  EyeSaver
//
//  Created by Arsenijs Mamikonans on 06/12/2018.
//  Copyright © 2018 Arsenijs Mamikonans. All rights reserved.
//

import Foundation
class EyeSaverVM : NSObject{

    @objc dynamic var change : Bool = true
    func waitTillPopup(_ index: Int){
        var minutes : Int
        switch index {
        case 0:
            minutes = 60
        case 1:
            minutes = 5 * 60
        case 2:
            minutes = 10 * 60
        case 3:
            minutes = 15 * 60
        case 4:
            minutes = 20 * 60
        case 5:
            minutes = 3
        default:
            minutes = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(minutes)) {
            self.change = !self.change
        }
    }
}
