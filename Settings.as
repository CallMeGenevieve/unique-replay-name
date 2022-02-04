// Draw Distance

[Setting name="Enabled" category="Replay Name Replacement" description="Enables replay name replacement"]
bool Setting_Enabled = false;

[Setting name="Replay Name" category="Replay Name Replacement" description="The name of the replay before the counting index.\nReplay Name and Counter can be max. 10 characters long."]
string Setting_ReplayName = "replay";

[Setting name="Digits" category="Replay Name Replacement" description="Sets the amount of digits that are added after the replay name" min="1" max="5"]
int Setting_AmountOfDigits = 4;

[Setting name="Counting Index" category="Replay Name Replacement" description="The index the counter is at" min="0"]
int Setting_CountingIndex = 0;
