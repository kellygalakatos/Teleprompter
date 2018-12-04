//
//  ViewController.swift
//  Teleprompter
//
//  Created by Kelly Galakatos on 12/4/18.
//  Copyright © 2018 Kelly Galakatos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var leftDragbarLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightDragbarLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftDragbarLeadingConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var rightDragbarLeadingConstraint2: NSLayoutConstraint!
    
    var timer: Timer?
    var yScroll = CGPoint.zero
    @IBAction func playButton(_ sender: UIBarButtonItem) {

        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
//            self.textView.transform = CGAffineTransform(translationX: 0, y: self.yScroll.y - 0.1)
            self.yScroll.y += 3
            self.textView.setContentOffset(self.yScroll, animated: true)
            
            
            
        }
    }
    
    @IBAction func pauseButton(_ sender: UIBarButtonItem) {
        guard let timer = timer else {
            return
        }
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
//        self.textView.transform = CGAffineTransform(translationX: 0, y: 0)
//        self.yScroll.y = 0
        guard let timer = timer else {
            return
        }
        timer.invalidate()
        self.yScroll.y = 0
        self.textView.setContentOffset(self.yScroll, animated: true)
    }
    
    var flipped = false
    @IBAction func flipButton(_ sender: UIBarButtonItem) {
        if (flipped == false) {
        textView.transform = CGAffineTransform(scaleX: 1, y: -1)
            flipped = true
        } else {
            textView.transform = CGAffineTransform(scaleX: 1, y: 1)
            flipped = false
        }
    }
    
    
    @IBAction func leftBarDrag(_ sender: UIPanGestureRecognizer) {
        let offset = sender.translation(in: self.view).x
        
        if(leftDragbarLeadingConstraint2.constant + offset > 0 && leftDragbarLeadingConstraint2.constant + offset < CGFloat(self.view.frame.width)/2 - 45) {
        leftDragbarLeadingConstraint.constant = leftDragbarLeadingConstraint.constant + offset
        rightDragbarLeadingConstraint.constant = rightDragbarLeadingConstraint.constant + offset
        leftDragbarLeadingConstraint2.constant = leftDragbarLeadingConstraint2.constant + offset
        rightDragbarLeadingConstraint2.constant = rightDragbarLeadingConstraint2.constant + offset
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func rightBarDrag(_ sender: UIPanGestureRecognizer) {
        let offset = sender.translation(in: self.view).x
        
        
        if(rightDragbarLeadingConstraint2.constant - offset > 0 && rightDragbarLeadingConstraint2.constant - offset < CGFloat(self.view.frame.width)/2 - 45){
        leftDragbarLeadingConstraint.constant = leftDragbarLeadingConstraint.constant - offset
        rightDragbarLeadingConstraint.constant = rightDragbarLeadingConstraint.constant - offset
        leftDragbarLeadingConstraint2.constant = leftDragbarLeadingConstraint2.constant - offset
        rightDragbarLeadingConstraint2.constant = rightDragbarLeadingConstraint2.constant - offset
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Dignissim sodales ut eu sem integer. Sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae. Cursus eget nunc scelerisque viverra mauris in aliquam sem. Dui faucibus in ornare quam viverra orci. Arcu odio ut sem nulla pharetra diam sit amet nisl. Consectetur libero id faucibus nisl tincidunt eget nullam non nisi. Aliquam eleifend mi in nulla posuere sollicitudin aliquam. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. A arcu cursus vitae congue mauris rhoncus aenean vel.\n\n" +
        "Id consectetur purus ut faucibus pulvinar. Urna et pharetra pharetra massa massa. Pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies. At volutpat diam ut venenatis tellus in metus vulputate eu. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant morbi. Malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet nulla. Id semper risus in hendrerit gravida. Eget gravida cum sociis natoque penatibus et magnis. Rhoncus mattis rhoncus urna neque viverra justo nec. Et tortor consequat id porta nibh venenatis. Quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Lectus quam id leo in vitae turpis massa sed. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. \n\n" +
        
        "Eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Quam vulputate dignissim suspendisse in est ante in nibh. Posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis. Amet massa vitae tortor condimentum lacinia quis vel eros donec. Volutpat est velit egestas dui id ornare. Pulvinar mattis nunc sed blandit libero volutpat sed cras. Ullamcorper sit amet risus nullam. Nunc congue nisi vitae suscipit. Id volutpat lacus laoreet non curabitur. Tincidunt augue interdum velit euismod. Fames ac turpis egestas sed tempus urna. Dui ut ornare lectus sit amet est placerat in egestas. Id diam maecenas ultricies mi. Arcu non sodales neque sodales ut etiam sit amet nisl. Natoque penatibus et magnis dis parturient montes nascetur.\n\n" +
        
        "Sed tempus urna et pharetra. Ut sem viverra aliquet eget sit amet tellus cras. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Nunc sed blandit libero volutpat sed cras ornare. Lobortis mattis aliquam faucibus purus in. Amet nisl suscipit adipiscing bibendum. Ultrices in iaculis nunc sed augue lacus viverra vitae congue. Condimentum lacinia quis vel eros donec ac odio tempor. Posuere sollicitudin aliquam ultrices sagittis orci a. Leo duis ut diam quam. Leo duis ut diam quam nulla porttitor massa id. Nisi lacus sed viverra tellus in hac habitasse platea. Non sodales neque sodales ut etiam sit amet. Nulla facilisi nullam vehicula ipsum a arcu cursus vitae. Diam vel quam elementum pulvinar etiam non quam lacus.\n\n" +
        
        "Ut diam quam nulla porttitor massa id. Cursus vitae congue mauris rhoncus aenean vel elit scelerisque. Urna nunc id cursus metus aliquam eleifend. Nibh praesent tristique magna sit amet purus gravida. Eu ultrices vitae auctor eu augue ut lectus arcu bibendum. Praesent semper feugiat nibh sed pulvinar proin gravida hendrerit. Faucibus purus in massa tempor nec feugiat nisl pretium. Vitae auctor eu augue ut lectus. Quis lectus nulla at volutpat diam ut venenatis tellus in. Adipiscing elit pellentesque habitant morbi tristique senectus et netus et. Lacus luctus accumsan tortor posuere ac ut consequat. Condimentum mattis pellentesque id nibh tortor id aliquet. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Elit at imperdiet dui accumsan sit amet. Sed augue lacus viverra vitae congue eu. Vitae suscipit tellus mauris a diam maecenas sed. Varius vel pharetra vel turpis nunc. Purus ut faucibus pulvinar elementum integer enim neque volutpat ac.\n\n" +
        
        "Condimentum lacinia quis vel eros donec ac odio. Amet nisl purus in mollis nunc sed id. Dolor sit amet consectetur adipiscing. Scelerisque fermentum dui faucibus in ornare quam viverra. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit. At tempor commodo ullamcorper a lacus. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Sit amet consectetur adipiscing elit. Quis vel eros donec ac odio tempor. Id aliquet lectus proin nibh. Libero enim sed faucibus turpis.\n\n" +
        
        "Porttitor leo a diam sollicitudin. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Ac turpis egestas maecenas pharetra convallis posuere. In mollis nunc sed id. Ac turpis egestas integer eget aliquet nibh. Id interdum velit laoreet id donec ultrices. Ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim. Orci eu lobortis elementum nibh tellus molestie nunc non blandit. Quisque egestas diam in arcu cursus. Est lorem ipsum dolor sit amet consectetur.\n\n" +
        
        "Dolor sit amet consectetur adipiscing elit. Tincidunt arcu non sodales neque sodales ut etiam. Id interdum velit laoreet id donec ultrices tincidunt arcu. Volutpat ac tincidunt vitae semper. Duis ut diam quam nulla porttitor. Et odio pellentesque diam volutpat commodo sed egestas egestas. Nulla pharetra diam sit amet nisl suscipit. Cursus sit amet dictum sit amet justo. Quam quisque id diam vel quam elementum pulvinar etiam. Id nibh tortor id aliquet lectus proin nibh. Lectus proin nibh nisl condimentum id venenatis a condimentum vitae. Sit amet nisl suscipit adipiscing bibendum est ultricies integer. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere. Amet dictum sit amet justo donec. Porttitor eget dolor morbi non arcu risus quis varius quam. Dis parturient montes nascetur ridiculus mus mauris. Non tellus orci ac auctor augue mauris augue. Diam sit amet nisl suscipit adipiscing bibendum. Viverra vitae congue eu consequat ac felis. Nam at lectus urna duis convallis convallis tellus."
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

