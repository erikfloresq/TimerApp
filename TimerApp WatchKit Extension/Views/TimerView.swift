//
//  TimerView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

struct CustomTimer: Identifiable {
    var id: UUID = UUID()
    var timeLimit: CGFloat
}

struct TimerView: View {
    @Environment(\.presentationMode) var presentationMode
    let timer = Timer.publish(every: 1.0,
                              on: .current,
                              in: .common).autoconnect()
    private let customTimer: CustomTimer
    @State private var currentTime: String = ""
    @State private var count: CGFloat

    init(customTimer: CustomTimer) {
        self.customTimer = customTimer
        self._count = State(initialValue: CGFloat(self.customTimer.timeLimit))
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
                currentTime = timeString(time: count)
                self.count = count - 1
            }
        }
    }

    func timeString(time: CGFloat) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(customTimer: CustomTimer(timeLimit: 120.0))
    }
}
