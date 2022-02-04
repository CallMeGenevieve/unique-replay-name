bool uniqueStringSet = false;

void Main() {
#if MP4
    CGameCtnApp@ app = GetApp();
    while (app.BasicDialogs is null) {
        yield();
    }
    auto basicDialogs = app.BasicDialogs;
    
    while (true) {
        if (Setting_Enabled && basicDialogs.DialogSaveAs_Path.StartsWith("Replays")) {
            if (string(basicDialogs.String).get_Length() > 0 && !uniqueStringSet) {
                basicDialogs.String = Setting_ReplayName;

                // Adds '0' until the rest of the digits can be filled with the counter
                for (int i = tostring(Setting_CountingIndex).get_Length(); i < Setting_AmountOfDigits; i++) {
                    basicDialogs.String = basicDialogs.String + "0";
                }
                // Adds the counter to the String
                basicDialogs.String = basicDialogs.String + tostring(Setting_CountingIndex);
                Setting_CountingIndex += 1;
                if (Setting_CountingIndex >= 10 ** Setting_AmountOfDigits) {
                    Setting_CountingIndex = 0;
                }
                uniqueStringSet = true;
            } else if (uniqueStringSet && basicDialogs.DialogSaveAs_Files.get_Length() == 0) {
                uniqueStringSet = false;
                basicDialogs.String = "";
            }
        }
        sleep(100);
    }
#endif
}

void OnSettingsChanged()
{
	if (Setting_ReplayName.get_Length() + Setting_AmountOfDigits > 10) {
        Setting_ReplayName = Setting_ReplayName.SubStr(0, 10 - Setting_AmountOfDigits);
    }
    if (Setting_CountingIndex < 0) {
        Setting_CountingIndex = 0;
    }
    if (Setting_CountingIndex >= 10 ** Setting_AmountOfDigits) {
        Setting_CountingIndex = 10 ** Setting_AmountOfDigits - 1;
    }
}
