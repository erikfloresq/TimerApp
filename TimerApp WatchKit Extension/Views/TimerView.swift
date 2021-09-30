//
//  TimerView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.presentationMode) var presentationMode
    let timeFinishInSeconds: Int
    let timerViewModel = TimerViewModel()
    @State private var currentTime: String
    @State private var count: CGFloat = 0
    @State var timer = Timer.publish(every: 1.0,
                              on: .main,
                              in: .common).autoconnect()

    init(timeFinishInSeconds: Int) {
        self.timeFinishInSeconds = timeFinishInSeconds
        self._count = State(initialValue: CGFloat(self.timeFinishInSeconds))
        let timeLimit = CGFloat(self.timeFinishInSeconds)
        self._currentTime = State(initialValue: timerViewModel.timeString(time: timeLimit))
    }

    var body: some View {
        Group {
            if count == 0 {
                finishView()
            } else {
                timerView()
            }
        }
        .onReceive(timer) { time in
            currentTime = timerViewModel.timeString(time: count)
            if count == 0 {
                self.timer.upstream.connect().cancel()
            } else {
                self.count = count - 1
            }
        }
    }

    func timerView() -> some View {
        VStack(spacing: 20) {
            HStack {
                Text("\(currentTime)")
            }.font(.system(size: 40))
            Button {
                self.timer.upstream.connect().cancel()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel")
            }
            .background(.red)
            .cornerRadius(10)
        }
    }

    func finishView() -> some View {
        VStack(spacing: 20) {
            Text("Finish!").font(.system(size: 40))
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }
            .background(.green)
            .cornerRadius(10)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeFinishInSeconds: 120)
    }
}
