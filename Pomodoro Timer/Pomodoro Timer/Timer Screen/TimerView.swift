import UIKit
import SnapKit

protocol FiveMinButtonTimerViewDelegate: AnyObject {
    func setFiveMinTimerButtonDidPressed()
}
protocol TenMinButtonTimerViewDelegate: AnyObject {
    func setTenMinTimerButtonDidPressed()
}
protocol FifteenMinButtonTimerViewDelegate: AnyObject {
    func setFifteenMinTimerButtonDidPressed()
}
protocol TwentyFiveMinButtonTimerViewDelegate: AnyObject {
    func setTwentyFiveMinTimerButtonDidPressed()
}
protocol PauseButtonTimerViewDelegate: AnyObject {
    func pauseButtonDidPressed()
}

class TimerView: UIView {

    private lazy var appNameLabel: UILabel = UILabel()
    @Published var timerLabel: UILabel = UILabel()

    private lazy var setFiveMinTimerButton: UIButton = UIButton()
    private lazy var setTenMinTimerButton: UIButton = UIButton()
    private lazy var setFifteenMinTimerButton: UIButton = UIButton()
    private lazy var setTwentyFiveMinTimerButton: UIButton = UIButton()

    private lazy var pauseTimerButton: UIButton = UIButton()

    weak var fiveMinTimerButtonDelegate: FiveMinButtonTimerViewDelegate?
    weak var tenMinTimerButtonDelegate: TenMinButtonTimerViewDelegate?
    weak var fifteenMinTimerButtonDelegate: FifteenMinButtonTimerViewDelegate?
    weak var twentyFiveMinTimerButtonDelegate: TwentyFiveMinButtonTimerViewDelegate?

    weak var pauseButtonDelegate: PauseButtonTimerViewDelegate?


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFunc() {
        setupAppNameLabel()

        setupSetFiveMinTimerButton()
        setupSetTenMinTimerButton()
        setupSetFifteenMinTimerButton()
        setupSetTwentyFiveMinTimerButton()
        setupMinuteButtonsStackView()

        setupTimerLabel()
        setupPauseTimerButton()
    }

    func setupAppNameLabel() {
        addSubview(appNameLabel)

        appNameLabel.text = "Pomodoro Timer"
        appNameLabel.numberOfLines = .zero
        appNameLabel.font = .systemFont(ofSize: 28, weight: .heavy, width: .condensed)
        appNameLabel.textColor = .red
        appNameLabel.textAlignment = .center

        appNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
    }
    func setupTimerLabel() {
        addSubview(timerLabel)

        timerLabel.text = "Time"
        timerLabel.numberOfLines = .zero
        timerLabel.font = .systemFont(ofSize: 80, weight: .heavy, width: .condensed)
        timerLabel.textColor = .red
        timerLabel.textAlignment = .center

        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(setFiveMinTimerButton.snp.bottom).offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
//    5 min
    func setupSetFiveMinTimerButton() {

        setFiveMinTimerButton.setTitle("5 min", for: .normal)
        setFiveMinTimerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        setFiveMinTimerButton.titleLabel?.textAlignment = .justified
        setFiveMinTimerButton.layer.cornerRadius = 20
        setFiveMinTimerButton.clipsToBounds = true
        setFiveMinTimerButton.backgroundColor = .red
        setFiveMinTimerButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.fiveMinTimerButtonDelegate?.setFiveMinTimerButtonDidPressed()
        }

        setFiveMinTimerButton.addAction(action, for: .touchUpInside)

        setFiveMinTimerButton.snp.makeConstraints { make in
            make.width.equalTo(75)
        }
    }
//    10 min
    func setupSetTenMinTimerButton() {

        setTenMinTimerButton.setTitle("10 min", for: .normal)
        setTenMinTimerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        setTenMinTimerButton.titleLabel?.textAlignment = .justified
        setTenMinTimerButton.layer.cornerRadius = 20
        setTenMinTimerButton.clipsToBounds = true
        setTenMinTimerButton.backgroundColor = .red
        setTenMinTimerButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.tenMinTimerButtonDelegate?.setTenMinTimerButtonDidPressed()
        }

        setTenMinTimerButton.addAction(action, for: .touchUpInside)

        setTenMinTimerButton.snp.makeConstraints { make in
            make.width.equalTo(75)
        }
    }
//    15 min
    func setupSetFifteenMinTimerButton() {

        setFifteenMinTimerButton.setTitle("15 min", for: .normal)
        setFifteenMinTimerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        setFifteenMinTimerButton.titleLabel?.textAlignment = .justified
        setFifteenMinTimerButton.layer.cornerRadius = 20
        setFifteenMinTimerButton.clipsToBounds = true
        setFifteenMinTimerButton.backgroundColor = .red
        setFifteenMinTimerButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.fifteenMinTimerButtonDelegate?.setFifteenMinTimerButtonDidPressed()
        }

        setFifteenMinTimerButton.addAction(action, for: .touchUpInside)

        setFifteenMinTimerButton.snp.makeConstraints { make in
            make.width.equalTo(75)
        }
    }
//    25 min
    func setupSetTwentyFiveMinTimerButton() {

        setTwentyFiveMinTimerButton.setTitle("25 min", for: .normal)
        setTwentyFiveMinTimerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        setTwentyFiveMinTimerButton.titleLabel?.textAlignment = .justified
        setTwentyFiveMinTimerButton.layer.cornerRadius = 20
        setTwentyFiveMinTimerButton.clipsToBounds = true
        setTwentyFiveMinTimerButton.backgroundColor = .red
        setTwentyFiveMinTimerButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.twentyFiveMinTimerButtonDelegate?.setTwentyFiveMinTimerButtonDidPressed()
        }

        setTwentyFiveMinTimerButton.addAction(action, for: .touchUpInside)

        setTwentyFiveMinTimerButton.snp.makeConstraints { make in
            make.width.equalTo(75)
        }
    }
    func setupMinuteButtonsStackView() {
        let stackView = UIStackView(arrangedSubviews: [setFiveMinTimerButton,
                                                       setTenMinTimerButton,
                                                       setFifteenMinTimerButton,
                                                       setTwentyFiveMinTimerButton])
        stackView.axis = .horizontal
        stackView.spacing = 15

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
        }
    }
    func setupPauseTimerButton() {
        addSubview(pauseTimerButton)

        pauseTimerButton.setTitle("Pause", for: .normal)
        pauseTimerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        pauseTimerButton.titleLabel?.textAlignment = .justified
        pauseTimerButton.layer.cornerRadius = 20
        pauseTimerButton.clipsToBounds = true
        pauseTimerButton.backgroundColor = .red
        pauseTimerButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.pauseButtonDelegate?.pauseButtonDidPressed()
        }

        pauseTimerButton.addAction(action, for: .touchUpInside)

        pauseTimerButton.snp.makeConstraints { make in
            make.top.equalTo(timerLabel.snp.bottom).offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(45)
        }
    }

}
extension TimerView: TimerStringUpdaterTimerViewControllerDelegate, PauseNameUpdaterTimerViewControllerDelegate {
    func pauseNameUpdater(name: String) {
        pauseTimerButton.setTitle(name, for: .normal)
    }
    func timerUpdater(timer: String) {
        timerLabel.text = timer
    }
}
