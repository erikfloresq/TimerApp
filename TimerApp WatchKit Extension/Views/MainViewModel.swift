//
//  MainViewModel.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 22/9/21.
//

import Foundation

struct MainViewModel {
    func getSeconds(from finishTime: FinishTime) -> Int {
        let hoursInSeconds = finishTime.hour*60*60
        let minutesInSeconds = finishTime.minute*60
        return hoursInSeconds + minutesInSeconds + finishTime.seconds
    }
}
