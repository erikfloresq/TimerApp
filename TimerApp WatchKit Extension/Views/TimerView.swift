//
//  TimerView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.presentationMode) var presentationMode
    let timer = Timer.publish(every: 1.0,
                              on: .current,
                              in: .common).autoconnect()
    let timeFinishInSeconds: Int
    let timerViewModel = TimerViewModel()
    @State private var currentTime: String
    @State private var count: CGFloat

    init(timeFinishInSeconds: Int) {
        self.timeFinishInSeconds = timeFinishInSeconds
        self._count = State(initialValue: CGFloat(self.timeFinishInSeconds))
        let timeLimit = CGFloat(self.timeFinishInSeconds)
        self._currentTime = State(initialValue: timerViewModel.timeString(time: timeLimit))
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("\(currentTime)")
            }.font(.system(size: 40))
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel")
            }
            .background(.red)
            .cornerRadius(10)
        }.onReceive(timer) { time in
            if count == 0 {
                timer.upstream.connect().cancel()
            } else {
                currentTime = timerViewModel.timeString(time: count)
                self.count = count - 1
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeFinishInSeconds: 120)
    }
}
