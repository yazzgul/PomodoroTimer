import UIKit
import SnapKit

protocol SetOneTimerButtonMainViewDelegate: AnyObject {
    func setOneTimerButtonDidPressed()
}

class MainView: UIView {

    private lazy var appNameLabel: UILabel = UILabel()
    private lazy var setOneTimerButton: UIButton = UIButton()

    weak var setOneTimerButtonDelegate: SetOneTimerButtonMainViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupFunc() {
        setupAppNameLabel()
        setupSetOneTimerButton()
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
    func setupSetOneTimerButton() {
        addSubview(setOneTimerButton)

        setOneTimerButton.setTitle("Set timer", for: .normal)
        setOneTimerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        setOneTimerButton.titleLabel?.textAlignment = .justified
        setOneTimerButton.layer.cornerRadius = 20
        setOneTimerButton.clipsToBounds = true
        setOneTimerButton.backgroundColor = .red
        setOneTimerButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.setOneTimerButtonDelegate?.setOneTimerButtonDidPressed()
        }

        setOneTimerButton.addAction(action, for: .touchUpInside)

        setOneTimerButton.snp.makeConstraints { make in
//            make.top.equalTo(appNameLabel.snp.bottom).offset(150)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(50)
        }
    }

}
