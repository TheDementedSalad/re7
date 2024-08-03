//Resident Evil 7 Autosplitter
//Originally by CursedToast 1/28/2017
//Maintained by TheDementedSalad 2022
//Last updated 29/04/2023

//Special thanks to:
// Souzooka - helping me re-code this to reduce lag and improving my coding in ASL. Couldn't have done this without him :)
//CarcinogenSDA (you know why)
//Dchaps - programming support
//shiftweave - programming support
//mgr.inz.Player - inventory memory value support
//Theumer115 - inventory memory value support
//DarkByte - inventory memory value support
//Nexusphobiker - helping me find the most updated pointers in the 2/6/2017 RE7 update, and for teaching me how to find them again in the future.
//TheDementedSalad - found pointers for Steam DX12 update & CeroD Splashscreen update + Made Jack's 55th  timer.
//Ero - ASL helper and code for mm:ss:fff timer for Jack's 55th

state("re7", "CeroD 20.5.0.2"){}
state("re7", "CeroD 20.4.0.2"){}
state("re7", "12/17 Update"){}
state("re7", "Endof DX11"){}
state("re7", "Next Gen"){}
state("re7", "6/10/22"){}
state("re7", "9/5/23"){}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
	vars.Helper.Settings.CreateFromXml("Components/RE7.Settings.xml");

	vars.TotalTimeInSeconds = 0f;
}

init
{
	IntPtr GameManager = vars.Helper.ScanRel(3, "4c 8b 05 ?? ?? ?? ?? 4d 85 c0 75 ?? 45 33 c0 41 8d 50 ?? e9");
	IntPtr CurrMap = vars.Helper.ScanRel(3, "48 8b 0d ?? ?? ?? ?? 80 b9 ?? ?? ?? ?? ?? 74 ?? c6 81 ?? ?? ?? ?? ?? eb ?? 83 f8");
	IntPtr InventoryManager = vars.Helper.ScanRel(3, "48 8b 05 ?? ?? ?? ?? 48 85 c0 0f 84 ?? ?? ?? ?? 48 83 78");
	IntPtr BirthdayGameMaster = vars.Helper.ScanRel(3, "48 8b 15 ?? ?? ?? ?? 74 ?? 45 33 c0");
	IntPtr Event = vars.Helper.ScanRel(3, "48 8b 15 ?? ?? ?? ?? 48 8b cb 48 85 d2 0f 84 ?? ?? ?? ?? e8 ?? ?? ?? ?? 0f b6 c8 48 8b 43 ?? 48 83 78 ?? ?? 0f 85 ?? ?? ?? ?? 85 c9 0f 95 c0");
	
	//_CurrentChapter
	vars.Helper["Chapter"] = vars.Helper.Make<byte>(GameManager, 0x54);
	//CurrentPause
	vars.Helper["gamePauseState"] = vars.Helper.Make<int>(GameManager, 0x104);
	//IsSceneLoading
	
	//isNotifyGameEnd
	vars.Helper["End55"] = vars.Helper.Make<bool>(BirthdayGameMaster, 0xB0);
	//app.BirthdayTimer > TotalBonusTime
	vars.Helper["Bonus55"] = vars.Helper.Make<int>(BirthdayGameMaster, 0x70, 0x58);
	//" > CurrentTimeLeft
	vars.Helper["IGT55"] = vars.Helper.Make<int>(BirthdayGameMaster, 0x70, 0x98);
	//" > CalcBonusTime
	vars.Helper["Extra55"] = vars.Helper.Make<int>(BirthdayGameMaster, 0x70, 0xC0);
	//" > isCanAddBonusTime
	vars.Helper["Start55"] = vars.Helper.Make<bool>(BirthdayGameMaster, 0x70, 0xC8);
	//app.BirthdayTransitionController > StageSetEnum
	vars.Helper["Type55"] = vars.Helper.Make<byte>(BirthdayGameMaster, 0x80, 0x58);
	//app.BirthdayTransitionController > Jump Target > 0x14
	vars.Helper["Level55"] = vars.Helper.MakeString(BirthdayGameMaster, 0x80, 0xC0, 0x14);
	//Base address of Inventory
	vars.Inv = InventoryManager;
	vars.Eve = Event;

	vars.splits = new HashSet<string>();
	vars.inventoryPtr = IntPtr.Zero;
	vars.fuse3PickedUp = 0;
	vars.fuse2PickedUp = 0;
	vars.eoz = 0;

	vars.Full55 = 0;
	vars.Timer55 = 0;
	vars.Finish55 = 0;
	
	vars.InventorySlots = 20;
    current.inventory = new string[vars.InventorySlots];
	
	string md5 = "";
    try {
        md5 = (string)vars.Helper.GetMD5Hash();
    } catch {
        // Failed to open file for MD5 computation.
    }
	
	switch (md5) {
			case "C505F2F8DD88C1478DA4B98FD49D7991":
				version = "12/17 Update";
			break;
			case "9EDD76273F6653F2B39DE5B9CBB6EFA4":
				version = "Next Gen";
			break;
			case "401BA759C4F1FE95ED06B33084FAA187":
				version = "6/10/22";
			break;
			case "43303BA085DE21ADE83D7D1FB2CC6B86":
				version = "9/5/23";
			break;
        default:
            // No version found with hash, fallback to memorySize
            switch ((int)vars.Helper.GetMemorySize()) {
			case (162795520):
				version = "CeroD 20.5.0.2";
				break;
			case (162783232):
				version = "CeroD 20.4.0.2";
				break;
			case (142331904):
				version = "Endof DX11";
				break;
		}
        break;
	}
	
	if (version == "Next Gen" || version == "6/10/22" || version == "9/5/23"){
		vars.Helper["Events"] = vars.Helper.MakeString(vars.Eve, 0x78, 0x80, 0x58, 0x10, 0x14);
		vars.Helper["Events"].FailAction = MemoryWatcher.ReadFailAction.SetZeroOrNull;
		vars.Helper["map"] = vars.Helper.MakeString(CurrMap, 0x960, 0x0);
		vars.Helper["isLoading"] = vars.Helper.Make<int>(GameManager, 0x1A4);
	}
	
	else{
		vars.Helper["Events"] = vars.Helper.MakeString(vars.Eve, 0x78, 0x80, 0x58, 0x20, 0x24);
		vars.Helper["Events"].FailAction = MemoryWatcher.ReadFailAction.SetZeroOrNull;
		vars.Helper["map"] = vars.Helper.MakeString(CurrMap, 0x700, 0x0);
		vars.Helper["isLoading"] = vars.Helper.Make<int>(GameManager, 0x1AC);
	}
}

update
{
	//print(modules.First().ModuleMemorySize.ToString());
	
	vars.Helper.Update();
	vars.Helper.MapPointers();
	current.inventory = new string[vars.InventorySlots];
	
	if (!settings["55th"]){
		vars.Helper.Texts.RemoveAll();
	}
	else if (current.Chapter == 26 && old.Chapter != 26){
		string level = current.Level55 + "_" + current.Type55;
		int startTime = 0;
		
		switch (level)
		{
			case "Stage1_0":
			case "Stage3_0":
			case "Stage3_1": 
				startTime = 900000; 
			break;
			case "Stage2_0":
				startTime = 600000;
			break;
			case "Stage2_1":
				startTime = 300000;
			break;
			case "Stage2_2":
				startTime = 480000;
			break;
		}
		
		var timeTaken = current.IGT55 + current.Extra55 - current.Bonus55;
		var timeLeft = startTime - timeTaken;
		
		vars.Total55 += timeLeft;
		vars.Helper.Texts["Total Time"].Right = TimeSpan.FromMilliseconds(vars.Total55).ToString(@"mm\:ss\.fff");
	}
	
	if(current.Events == "InteractEvent_GetSerum"){
		vars.eoz = 1;
		return true;
	}
	
	if (version == "Next Gen" || version == "6/10/22" || version == "9/5/23"){
		for (int i = 0; i < vars.InventorySlots; i++)
        current.inventory[i] = vars.Helper.ReadString(300, ReadStringType.UTF16, vars.Inv, 0x60, 0x10, 0x20 + i * 0x8, 0x18, 0x80, 0x14);
	}
	
	else{
		for (int i = 0; i < vars.InventorySlots; i++)
		current.inventory[i] = vars.Helper.ReadString(300, ReadStringType.UTF16, vars.Inv,  0x60, 0x20, 0x30 + (i * 8), 0x28, 0x80, 0x24);
	}
}

onStart
{
	if(settings["55th"]){
		vars.Helper.Texts["Total Time"].Left = "Time:";
		vars.Helper.Texts["Total Time"].Right = "00:00.000";
	}
	
	vars.splits.Clear();
	vars.fuse2PickedUp = 0;
	vars.fuse3PickedUp = 0;
	vars.Full55 = 0;
	vars.Finish55 = 0;
	vars.Timer55 = 0;
	vars.eoz = 0;
	vars.TotalTimeInSeconds = 0f;
}

start
{	
	return current.Events == "c00e00_00_pl2000" || // Main Game
		current.Chapter == 5 && (current.inventory[0] == "Knife" || current.inventory[1] == "Knife") && current.map == "c03_MainHouse1FWash" || // No Guest House
		current.map == "c04_CavePassage01" && current.inventory[0] == "CKnife" || // Not a Hero
		vars.eoz == 0 && old.gamePauseState == 262400 && current.gamePauseState == 0 || current.Events == "c09e11_00_pl9000" && old.Events != "c09e11_00_pl9000" || // End of Zoe
		current.Events == "c07e40_00_pl3400" || // Daughters
		current.Chapter == 29 && current.Events == "c07e10_00_pl3000" || // Bedroom
		current.Chapter == 34 && current.map == "c03_OldHouse1FBridge01" && current.inventory[0] == "Knife" || // Ethan Must Die
		(current.Chapter == 22 || current.Chapter == 23 || current.Chapter == 24 || current.Chapter == 25) && current.Start55 && !old.Start55; // Jack's 55th
}

split
{
	string setting = "";
	
	// Item splits
	string[] currentInventory = (current.inventory as string[]);
	string[] oldInventory = (old.inventory as string[]); // throws error first update, will be fine afterwards.
	for (int i = 0; i < vars.InventorySlots; i++) {
		if (old.inventory[i] == current.inventory[i])
			continue;

		var item = current.inventory[i];
	  
		if(!string.IsNullOrEmpty(item)){
			setting = "Item_" + item;
		}
	}
	
	//Removed item splits
	var removedItems = oldInventory.Except(currentInventory);

	if (removedItems.Contains("ChainSaw") && current.isLoading == 100){
		setting = "Event_UseChainsaw";
	}

	if (removedItems.Contains("Lantern") && current.isLoading == 100){
		setting = "Event_UseLantern";
	}

	if (removedItems.Contains("MachineGun")){
		setting = "Event_TapeEnd";
	}

	// Map splits
	if (current.map != old.map){
		setting = "Map_" + current.map;
	}

	if (current.map == "c03_TrailerHouse" && old.map != "c03_TrailerHouse" && current.Chapter == 5){
		setting = "Map_Trailer";
	}
	
	if(current.map == "c04_ShipB2Corridor01Past" && !vars.splits.Contains("Map_DownElev")){
		setting = "Map_DownElev";
	}
	
	if(current.map == "c04_Ship2FCorridorCPast" && vars.splits.Contains("Map_DownElev")){
		setting = "Map_UpElev";
	}
	
	//Events splits
	if(current.Events != old.Events && !string.IsNullOrEmpty(current.Events)){
		setting = "Event_" + current.Events;
	}
	
	if(old.Events == "c01e07_01_pl0000" && string.IsNullOrEmpty(current.Events)){
		setting = "Event_Welcome";
	}


	//End splits
	if (removedItems.Contains("Handgun_Albert")){
		setting = "Event_End";
	}
		
    if (old.map == "c08_BossRoom01" && current.inventory[0] != old.inventory[0] && !vars.splits.Contains("nah_end")){
		setting = "Event_NahEnd";
	}

    if(old.Events == "c09e43_00_pl9000" && string.IsNullOrEmpty(current.Events)){
		setting = "Event_ZoeEnd";
	}
	
	if(settings["55th"] && current.End55 && !old.End55){
		return true;
	}
	
	if(current.Events == "c07e46_00_pl3400" || current.Events == "c07e47_00_pl3400"){
		setting = "Event_DaughtEnd";
	}
	
	if (settings["bed"] && removedItems.Contains("MasterKey")){
		setting = "Event_BedEnd";
	}
	
	// Debug. Comment out before release.
	if (!string.IsNullOrEmpty(setting))
	vars.Log(setting);

	if (settings.ContainsKey(setting) && settings[setting] && vars.splits.Add(setting)){
		return true;
	}
}

isLoading
{	
	if(settings["55th"]){
		return current.gamePauseState != 0 && current.gamePauseState != 262400 && current.gamePauseState != 8 && current.gamePauseState != 262144 || current.End55;
	}
	
	else return current.gamePauseState != 0 && current.gamePauseState != 262400 && current.gamePauseState != 8 && current.gamePauseState != 262144 || current.Chapter == 3 || current.Chapter == 0 || current.Chapter == 1 || current.Chapter == 21 || current.Chapter == 28;
}

reset
{
	if (settings["55th"]){
		return current.gamePauseState == 0 && old.gamePauseState == 256;
	}
	
	if (settings["EMD"]){
		return current.gamePauseState == 0 && old.gamePauseState == 256;
	}
	
	if (settings["daught"]){
		return current.Chapter == 32 && old.Chapter == 28;
	}
	
	if (settings["eoz"]){
		if(vars.eoz == 0 && current.gamePauseState == 262400 && old.gamePauseState != 262400 || current.Events == "c09e11_00_pl9000" && old.Events != "c09e11_00_pl9000"){
			return true;
		}
	}
	
	if (settings["bed"]){
		return current.Chapter == 29 && old.Chapter == 28;
	}
	
	if (settings["nah"]){
		return current.gamePauseState == 0 && old.Chapter == 28;
	}
}
