//
//  TimerViewModel.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 22/9/21.
//

import UIKit

struct TimerViewModel {
    func timeString(time: CGFloat) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
