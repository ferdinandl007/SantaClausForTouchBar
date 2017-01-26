//  touchbar_santa
//
//  Created by Ferdinand Lösch on 08/12/2016.
//  Copyright © 2016 AVatsaev. All rights reserved.
//


import Cocoa
import AVFoundation


class SantaViewController: NSViewController , NSTouchBarDelegate{
  
  var audio_player: AVAudioPlayer?
  
        var sound: Bool = true {
    
    didSet{
      
      if sound {
        audio_player?.play()
        sound_btn.image = sound_btn_image_on
      }else{
        audio_player?.pause()
        sound_btn.image = sound_btn_image_off
      }

    }
    
  }
  
  var sound_btn_image_on: NSImage?
  var sound_btn_image_off: NSImage?
  
  
  @IBOutlet weak var sound_btn: NSButtonCell!
  @IBOutlet weak var bkg: NSView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.wantsLayer = true
    
  }
  
  
  @IBAction func toggle_sound(_ sender: Any) {
    
        sound = !sound
  }
  
  override func viewWillAppear() {
    
    bkg.layer?.backgroundColor = NSColor(red:1, green:1, blue:1, alpha:1.00).cgColor
    
    sound_btn_image_on = NSImage(named: "ic_volume_up_3x.png")
    sound_btn_image_off = NSImage(named: "ic_volume_off_3x.png")

    
    let santa_music = URL(fileURLWithPath: Bundle.main.path(forResource: "Merry_Xmas_Santa_Claus Is", ofType: "mp3")!)
    
    do {
      
      try audio_player = AVAudioPlayer(contentsOf: santa_music)
      audio_player?.numberOfLoops = -1
      audio_player?.prepareToPlay()
      
    }catch{}
    
    sound = true


  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

