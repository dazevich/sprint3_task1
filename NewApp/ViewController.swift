//
//  ViewController.swift
//  NewApp
//
//  Created by Даниил Азевич on 22.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var pressedCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextView.layer.cornerRadius = 8
        counterLabel.text = "\(pressedCount)"
        resetButton.setTitle("", for: .normal)
        resetButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
    }
    
    func updateLabel() {
        let preffix = pressedCount > 0 ? "Значение счётчика: " : ""
        counterLabel.text = "\(preffix)\(pressedCount)"
    }
    
    func updateHistory(_ event: CounterEvent) {
        let eventString = event.toEventDesc()
        historyTextView.text += eventString + "\n"
        scrollTextViewToBottom()
    }
    
    func scrollTextViewToBottom() {
        if historyTextView.text.count > 0 {
            let location = historyTextView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            historyTextView.scrollRangeToVisible(bottom)
        }
    }

    @IBAction func onIncrementPressed(_ sender: UIButton) {
        pressedCount+=1
        updateLabel()
        updateHistory(.increment)
    }
    
    @IBAction func onDecrementPressed(_ sender: Any) {
        let reduced = pressedCount - 1;
        if(reduced < 0) {
            updateHistory(.error)
        } else {
            pressedCount = reduced
            updateLabel()
            updateHistory(.decrement)
        }
        
    }
    
    @IBAction func onResetPressed(_ sender: UIButton) {
        pressedCount = 0
        updateLabel()
        updateHistory(.refresh)
    }
    
}

