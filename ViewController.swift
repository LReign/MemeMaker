//
//  ViewController.swift
//  MemeMaker
//
//  Created by R Mat on 4/29/19.
//

import UIKit

class ViewController: UIViewController {
    
    let topChoices = [CaptionOption(emoji: "🐱", caption: "Do you like cats?"), CaptionOption(emoji: "🐶", caption: "Do you like dogs?"), CaptionOption(emoji: "🦊", caption: "Do you like foxes?")]
    let bottomChoices = [CaptionOption(emoji: "⏰", caption: "...About time!"), CaptionOption(emoji: "🚧", caption: "No Entry"), CaptionOption(emoji: "🏅", caption: "You the best!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        loadCaptions(topCaptionSegmentedControl.selectedSegmentIndex, "top")
        
        //repeating for bottom
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        loadCaptions(bottomCaptionSegmentedControl.selectedSegmentIndex, "bottom")
    }

    
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    @IBAction func captionSegmentedControlAction(_ sender: Any) {
        if let sender = sender as? UISegmentedControl {
            if sender == topCaptionSegmentedControl {
                loadCaptions(sender.selectedSegmentIndex, "top")
            }
            else if sender == bottomCaptionSegmentedControl {
                loadCaptions(sender.selectedSegmentIndex, "bottom")
            }
            else {
                //should not be reached
            }
        }
    }
    
    func loadCaptions(_ segmentIndex: Int, _ topOrBottom: String){
        if (topOrBottom == "top") {
            topCaptionLabel.text = topChoices[segmentIndex].caption
        }
        else if (topOrBottom == "bottom") {
            bottomCaptionLabel.text = bottomChoices[segmentIndex].caption
        }
        else {
            //should not be reached
        }
    }
}
