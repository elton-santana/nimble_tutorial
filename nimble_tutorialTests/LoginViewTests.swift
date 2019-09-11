//
//  LoginViewTests.swift
//  nimble_tutorialTests
//
//  Created by Elton Santana on 11/09/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import nimble_tutorial

class LoginViewTests: QuickSpec {

    override func spec() {
        describe("LoginView") {
            var view: LoginView!
            
            beforeEach {
                view = LoginView()
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            it("should have a cool layout") {
                expect(view) == snapshot()
            }
            
            it("should hide loginButton if user set username only") {
                view.userNameTextField.setTextAndSendEvent("username")
                expect(view) == snapshot()
            }
            
            it("should hide loginButton if user set password only") {
                view.passwordTextField.setTextAndSendEvent("password")
                expect(view) == snapshot()
            }
            
            it("should show loginButton if user set username and password") {
                view.userNameTextField.setTextAndSendEvent("username")
                view.passwordTextField.setTextAndSendEvent("password")
                
                expect(view) == snapshot()

            }
        }
    }

}
