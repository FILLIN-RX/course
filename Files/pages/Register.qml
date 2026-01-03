import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    width: parent.width
    height: 940  // Fixed: Changed from 94 to 940
    signal registerSuccess()
    signal goToLogin()  // Added missing signal

    Rectangle {
        anchors.fill: parent
        color: "#D4E8E6"

        Rectangle {
            width: 550
            height: 560
            radius: 16
            color: "white"
            anchors.centerIn: parent

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 50
                spacing: 16

                // Logo - Fixed: Use placeholder
                Rectangle {
                    width: 56
                    height: 56
                    radius: 8
                    color: "#7C2AE8"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.bottomMargin: 4

                    Text {
                        anchors.centerIn: parent
                        text: "Logo"
                        color: "white"
                        font.pixelSize: 12
                    }
                }

                Text {
                    text: "Registration"
                    font.pixelSize: 24
                    font.weight: Font.DemiBold
                    Layout.alignment: Qt.AlignHCenter
                    Layout.bottomMargin: 12
                }

                // Name
                ColumnLayout {
                    spacing: 8
                    Layout.fillWidth: true

                    Text {
                        text: "Nom"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: "#1A1A1A"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 48
                        color: "#F5F5F5"
                        radius: 8
                        border.width: 1
                        border.color: "#E0E0E0"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 10

                            TextField {
                                id: nameField
                                Layout.fillWidth: true
                                font.pixelSize: 14
                                placeholderText: "Enter your name"
                                verticalAlignment: Text.AlignVCenter
                            }

                            Text {
                                text: "👤"
                                font.pixelSize: 20
                                color: "#666666"
                            }
                        }
                    }
                }

                // Email
                ColumnLayout {
                    spacing: 8
                    Layout.fillWidth: true

                    Text {
                        text: "Email"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: "#1A1A1A"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 48
                        color: "#F5F5F5"
                        radius: 8
                        border.width: 1
                        border.color: "#E0E0E0"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 10

                            TextField {
                                id: emailField
                                Layout.fillWidth: true
                                font.pixelSize: 14
                                placeholderText: "Enter your email"
                                verticalAlignment: Text.AlignVCenter
                            }

                            Text {
                                text: "✉"
                                font.pixelSize: 20
                                color: "#666666"
                            }
                        }
                    }
                }

                // Password
                ColumnLayout {
                    spacing: 8
                    Layout.fillWidth: true

                    Text {
                        text: "Mot de passe"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: "#1A1A1A"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 48
                        color: "#F5F5F5"
                        radius: 8
                        border.width: 1
                        border.color: "#E0E0E0"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 10

                            TextField {
                                id: passwordField
                                Layout.fillWidth: true
                                font.pixelSize: 14
                                placeholderText: "Enter your password"
                                echoMode: TextInput.Password
                                verticalAlignment: Text.AlignVCenter
                            }

                            Text {
                                text: "🔒"
                                font.pixelSize: 20
                                color: "#666666"
                            }
                        }
                    }
                }

                // Spacer
                Item {
                    Layout.fillHeight: true
                    Layout.minimumHeight: 10
                }

                // Sign Up Button - FIXED: Simplified
                Button {
                    text: "Sign up"
                    Layout.fillWidth: true
                    height: 48

                    // Material-compatible styling
                    palette.button: "#7C2AE8"
                    palette.buttonText: "white"

                    onClicked: {
                        console.log("Registration attempt:", nameField.text, emailField.text)
                        registerSuccess()  // Emit signal
                    }
                }

                // Sign in text
                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 8
                    spacing: 4

                    Text {
                        text: "deja un compte?"
                        font.pixelSize: 13
                        color: "#666666"
                    }

                    Button {
                        text: "Sign in"
                        font.pixelSize: 13
                        font.weight: Font.Bold
                        flat: true  // Makes it look like text
                        onClicked: goToLogin()  // Emit signal
                    }
                }
            }
        }
    }
}
