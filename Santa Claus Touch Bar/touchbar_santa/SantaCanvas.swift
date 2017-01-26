//  touchbar_santa
//
//  Created by Ferdinand Lösch on 08/12/2016.
//  Copyright © 2016 AVatsaev. All rights reserved.
//



import Cocoa
import CoreFoundation

class SantaCanvas: NSImageView {

    var xPosition: CGFloat = -400 {
        didSet {
            self.frame = CGRect(x: xPosition, y: 0, width: 1000, height: 30)
        }
    }
    var timer = Timer()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        self.animates = true
        self.image = NSImage(named: "Chicken_Santa_presents.gif")!
        self.canDrawSubviewsIntoLayer = true
        self.frame = CGRect(x: xPosition, y: 0, width: 685, height: 30)
       
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SantaCanvas.move) , userInfo: nil, repeats: false)
        
    }
    
    func move(){
        if xPosition < 400 {
            xPosition -= -2
        } else {
            xPosition = -400
        }
    }
    
}
