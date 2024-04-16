import Foundation
import Combine

class TimerModel {

    @Published var secondsRemaining = 0
    @Published var isTimeRunning = true
    @Published var timerString = "00:00"

    private var timer: Timer?

    init() {
        startTimerObj()
    }

    private func startTimerObj() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timeReduce()
//            print(self!.timerString)
        }
    }

    private func timeReduce() {
        if isTimeRunning && secondsRemaining > 0 {
            secondsRemaining = secondsRemaining - 1
        }
        timerString = formatTime(seconds: secondsRemaining)
    }

    private func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }

    func setFiveMinRemaining() {
        secondsRemaining = 5 * 60
//        print(secondsRemaining)
    }
    func setTenMinRemaining() {
        secondsRemaining = 10 * 60
    }
    func setFifteenMinRemaining() {
        secondsRemaining = 15 * 60
    }
    func setTwentyFiveMinRemaining() {
        secondsRemaining = 25 * 60
    }

    func timeRunningChange() {
        if isTimeRunning {
            isTimeRunning = false
        }
        else {
            isTimeRunning = true
        }
    }

}
