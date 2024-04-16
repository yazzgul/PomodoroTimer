import UIKit

class MainViewController: UIViewController {

    private var contentView: MainView = .init()

    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        contentView.setOneTimerButtonDelegate = self
    }

}
extension MainViewController: SetOneTimerButtonMainViewDelegate {
    func setOneTimerButtonDidPressed() {
        let timerModel = TimerModel()
        let timerVC = TimerViewController(viewModel: timerModel)
        navigationController?.pushViewController(timerVC, animated: true)
    }
}
