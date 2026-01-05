import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root
    width: 360
    height: 640
    visible: true
    title: "Gestion Académique"

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: loginPage
    }

    /* ===== LOGIN ===== */
    Component {
        id: loginPage
        Login {
            onLoginSuccess: {
                console.log("Logged in!")
                stack.replace(mainPage)   // 👉 remplace login par l'app principale
            }

            onGoToRegister: {
                stack.push(registerPage)
            }
        }
    }

    /* ===== REGISTER ===== */
    Component {
        id: registerPage
        Register {
            onRegisterSuccess: {
                console.log("Registered!")
                stack.pop()   // retour login
            }

            onGoToLogin: {
                stack.pop()
            }
        }
    }

    /* ===== MAIN APP ===== */
    Component {
        id: mainPage
        MainPage { }
    }
}
