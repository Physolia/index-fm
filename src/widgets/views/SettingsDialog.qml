import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

import org.mauikit.controls 1.2 as Maui
import org.mauikit.filebrowsing 1.0 as FB

Maui.SettingsDialog
{
    Maui.SettingsSection
    {
        title: i18n("Navigation")
        description: i18n("Configure the app plugins and behavior.")

        Maui.SettingTemplate
        {
            label1.text: i18n("Thumbnails")
            label2.text: i18n("Show previews of images, videos and PDF files")

            Switch
            {
                Layout.fillHeight: true
                checkable: true
                checked:  settings.showThumbnails
                onToggled: settings.showThumbnails = ! settings.showThumbnails
            }
        }

        Maui.SettingTemplate
        {
            label1.text:  i18n("Save Session")
            label2.text: i18n("Save and restore tabs")

            Switch
            {
                Layout.fillHeight: true
                checkable: true
                checked:  settings.restoreSession
                onToggled: settings.restoreSession = !settings.restoreSession
            }
        }
    }

    Maui.SettingsSection
    {
        title: i18n("Places")
        description: i18n("Toggle sidebar sections.")
        lastOne: true

        Maui.SettingTemplate
        {
            label1.text: i18n("Quick places")
            label2.text: i18n("Acess to standard locations.")

            Switch
            {
                checkable: true
                checked: appSettings.quickSidebarSection
                onToggled: appSettings.quickSidebarSection = !appSettings.quickSidebarSection
            }
        }

        Maui.SettingTemplate
        {
            label1.text: i18n("Bookmarks")
            label2.text: i18n("Acess to standard locations.")


            Switch
            {
                checkable: true
                checked: placesSidebar.list.groups.includes(FB.FMList.BOOKMARKS_PATH)
                onToggled:
                {
                    toggleSection(FB.FMList.BOOKMARKS_PATH)
                }
            }
        }

        Maui.SettingTemplate
        {
            label1.text: i18n("Remote")
            label2.text: i18n("Acess to network locations.")

            Switch
            {
                checkable: true
                checked: placesSidebar.list.groups.includes(FB.FMList.REMOTE_PATH)
                onToggled:
                {
                    toggleSection(FB.FMList.REMOTE_PATH)
                }
            }

        }

        Maui.SettingTemplate
        {
            label1.text: i18n("Removable")
            label2.text: i18n("Acess to USB sticks and SD Cards.")

            Switch
            {
                checkable: true
                checked: placesSidebar.list.groups.includes(FB.FMList.REMOVABLE_PATH)
                onToggled:
                {
                    toggleSection(FB.FMList.REMOVABLE_PATH)
                }
            }
        }

        Maui.SettingTemplate
        {
            label1.text: i18n("Devices")
            label2.text: i18n("Acess drives.")

            Switch
            {
                checkable: true
                checked: placesSidebar.list.groups.includes(FB.FMList.DRIVES_PATH)
                onToggled:
                {
                    toggleSection(FB.FMList.DRIVES_PATH)
                }
            }
        }
    }

    Maui.SettingsSection
    {
        title: i18n("Interface")
        description: i18n("Configure the app UI.")
        lastOne: true

        Maui.SettingTemplate
        {
            label1.text: i18n("Grid Items Size")
            label2.text: i18n("Size of the grid view.")

            Maui.ToolActions
            {
                expanded: true
                autoExclusive: true
                display: ToolButton.TextOnly

                currentIndex: appSettings.gridSize

                Action
                {
                    text: i18n("S")
                    onTriggered: appSettings.gridSize = 0
                }

                Action
                {
                    text: i18n("M")
                    onTriggered: appSettings.gridSize = 1
                }

                Action
                {
                    text: i18n("L")
                    onTriggered: appSettings.gridSize = 2
                }

                Action
                {
                    text: i18n("X")
                    onTriggered: appSettings.gridSize = 3
                }

                Action
                {
                    text: i18n("XL")
                    onTriggered: appSettings.gridSize = 4
                }
            }
        }

        Maui.SettingTemplate
        {
            label1.text: i18n("List Items Size")
            label2.text: i18n("Size of the list view.")

            Maui.ToolActions
            {
                expanded: true
                autoExclusive: true
                display: ToolButton.TextOnly

                currentIndex: appSettings.listSize

                Action
                {
                    text: i18n("S")
                    onTriggered: appSettings.listSize = 0
                }

                Action
                {
                    text: i18n("M")
                    onTriggered: appSettings.listSize = 1
                }

                Action
                {
                    text: i18n("L")
                    onTriggered: appSettings.listSize = 2
                }

                Action
                {
                    text: i18n("X")
                    onTriggered: appSettings.listSize = 3
                }

                Action
                {
                    text: i18n("XL")
                    onTriggered: appSettings.listSize = 4
                }
            }
        }

        //        Maui.SettingTemplate
        //        {
        //            label1.text: i18n("Overview")
        //            label2.text: i18n("Use overview mode as default on launch")

        //            Switch
        //            {
        //                Layout.fillHeight: true
        //                checked:  appSettings.overviewStart
        //                onToggled: appSettings.overviewStart = !appSettings.overviewStart
        //            }
        //        }
    }


}
