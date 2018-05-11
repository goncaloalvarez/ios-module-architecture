import UIKit
import RxSwift

public final class LoginViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private let loginInteractor = LoginInteractor()

    private lazy var component: LoginComponent = {

        let component = LoginComponent()
        component.delegate = self
        return component
    }()

    public override func loadView() {

        self.view = self.component
    }

    public override func viewDidLoad() {

        super.viewDidLoad()
        self.component.render(configuration: LoginConfiguration(title: "BRAND"))
    }
}

extension LoginViewController: LoginComponentDelegate {

    func didSubmitLoginForm(email: String?, password: String?) {

        guard let email = email, let password = password else { return }

        self.loginInteractor
            .loginWith(username: email, password: password)
            .subscribe { [weak self] (event) in

                self?.handleLoginEvent(event)
            }
            .disposed(by: self.disposeBag)
    }

    private func handleLoginEvent(_ event: SingleEvent<User>) {

        switch event {
        case .success(let user):
            self.component.showLoggedInUser(user)
        case .error(let error):
            print(error)
        }
    }
}
