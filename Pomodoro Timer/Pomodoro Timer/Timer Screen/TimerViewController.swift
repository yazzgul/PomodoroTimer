import UIKit
import Combine

protocol TimerStringUpdaterTimerViewControllerDelegate: AnyObject {
    func timerUpdater(timer: String)
}
protocol PauseNameUpdaterTimerViewControllerDelegate: AnyObject {
    func pauseNameUpdater(name: String)
}

class TimerViewController: UIViewController {

    private let contentView: TimerView = .init()

    private let viewModel: TimerModel

    weak var timerUpdaterDelegate: TimerStringUpdaterTimerViewControllerDelegate?
    weak var pauseNameUpdaterDelegate: PauseNameUpdaterTimerViewControllerDelegate?

    private var cancellables: Set<AnyCancellable> = []

    init(viewModel: TimerModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        timerUpdaterDelegate = contentView
        pauseNameUpdaterDelegate = contentView

        contentView.fiveMinTimerButtonDelegate = self
        contentView.tenMinTimerButtonDelegate = self
        contentView.fifteenMinTimerButtonDelegate = self
        contentView.twentyFiveMinTimerButtonDelegate = self
        contentView.pauseButtonDelegate = self

        configureTimer()
        configurePauseButtonName()
    }

    func configureTimer() {
        viewModel.$timerString
            .sink { time in
                self.timerUpdaterDelegate?.timerUpdater(timer: time)
            }.store(in: &cancellables)
    }

    func configurePauseButtonName() {
        viewModel.$isTimeRunning
            .sink { bool in
                if bool == false {
                    self.pauseNameUpdaterDelegate?.pauseNameUpdater(name: "Start")
                }
                else {
                    self.pauseNameUpdaterDelegate?.pauseNameUpdater(name: "Pause")
                }
            }.store(in: &cancellables)
    }

}
extension TimerViewController: FiveMinButtonTimerViewDelegate, TenMinButtonTimerViewDelegate, FifteenMinButtonTimerViewDelegate, TwentyFiveMinButtonTimerViewDelegate, PauseButtonTimerViewDelegate {
    
    func setFiveMinTimerButtonDidPressed() {
        viewModel.setFiveMinRemaining()
    }

    func setTenMinTimerButtonDidPressed() {
        viewModel.setTenMinRemaining()
    }
    
    func setFifteenMinTimerButtonDidPressed() {
        viewModel.setFifteenMinRemaining()
    }
    
    func setTwentyFiveMinTimerButtonDidPressed() {
        viewModel.setTwentyFiveMinRemaining()
    }
    
    func pauseButtonDidPressed() {
        viewModel.timeRunningChange()
    }

}
