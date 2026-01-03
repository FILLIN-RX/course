import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 360
    height: 640
    visible: true
    title: "Login/Register"

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: loginPage
    }

    Component {
        id: loginPage
        Login {
            onLoginSuccess: {  // Signal name matches Login.qml
                console.log("Logged in!")
                // tu peux push la page principale après login
            }
            onGoToRegister: {  // Signal name matches Login.qml
                stack.push(registerPage)  // passe à l'écran d'inscription
            }
        }
    }

    Component {
        id: registerPage
        Register {
            onRegisterSuccess: {
                console.log("Registered!")
                stack.pop()  // retourne au login
            }
            onGoToLogin: {  // Need this signal in Register.qml
                stack.pop()
            }
        }
    }
}
