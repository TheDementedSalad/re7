//Resident Evil 7 Autosplitter
//By CursedToast 1/28/2017
//Last updated 1/21/2018

//Special thanks to:
//CarcinogenSDA (you know why)
//Dchaps - programming support
//shiftweave - programming support
//mgr.inz.Player - inventory memory value support
//Theumer115 - inventory memory value support
//DarkByte - inventory memory value support
//Nexusphobiker - helping me find the most updated pointers in the 2/6/2017 RE7 update, and for teaching me how to find them again in the future.

state("re7", "1.1")
{
	int isPaused : "re7.exe", 0x0707C290, 0x28, 0x30, 0x58, 0x730;
	float igt : "re7.exe", 0x0704D5C8, 0x28, 0x428, 0x40, 0x28, 0x120;
	string128 map : "re7.exe", 0x07046390, 0x700, 0x0;
	int isdying : "re7.exe", 0x0707FCD0, 0x60;
	//int coins : "re7.exe", 0x07047D58, 0x5A0, 0x170, 0x40, 0x80, 0x20;
	//int files : "re7.exe", 0x07046398, 0xC0, 0x3B8, 0xB0, 0x78, 0x490; WIP. Coin and file count memory value is differnt per difficulty. This value is for Normal, apparently. Come back later when you found the difficulty memory value, I suppose.
}

state("re7", "1.2")
{
	int isPaused : "re7.exe", 0x708E260, 0x28, 0x30, 0x58, 0x730;
	string128 map : "re7.exe", 0x7058360, 0x700, 0x0;
	int isdying : "re7.exe", 0x07091CA0, 0x60;
}

state("re7", "1.3")
{
	int isPaused : "re7.exe", 0x071116A8, 0x28, 0x30, 0x58, 0x730;
	string128 map : "re7.exe", 0x071492F8, 0x700, 0x0;
	int isdying : "re7.exe", 0x070DADB0, 0x60;
}

state("re7", "1.4")
{
	int isPaused : "re7.exe", 0x082186C0, 0x28, 0x30, 0x68, 0x150;
	string128 map : "re7.exe", 0x081DE6A8, 0x700, 0x0;
	int isdying : "re7.exe", 0x081E4148, 0x60;
}

state("re7", "cerod")
{
	int isPaused : "re7.exe", 0x093698F0, 0x30,0x30, 0x38, 0x58, 0x630;
	string128 map : "re7.exe", 0x0932F7E8, 0x700, 0x0;
	int isdying : "re7.exe", 0x093352C0, 0x60;
}

startup
{
	settings.Add("maingame", false, "Main Campaign");
	settings.Add("c01_Corridor01", false, "Reached the Guest House", "maingame");
	settings.Add("ChainCutter", false, "Bolt Cutters", "maingame");
	settings.Add("HandAxe", false, "Axe (first time)", "maingame");
	settings.Add("Fuse", false, "Fuse (Guest House)", "maingame");
	settings.Add("welcome2family", false, "Welcome to the family (splits during drag scene)", "maingame");
	settings.Add("FloorDoorKey", false, "Hatch Key", "maingame");
	settings.Add("Knife", false, "Knife", "maingame");
	settings.Add("Handgun_M19", false, "M19 (Guest House gun)", "maingame");
	settings.Add("Handgun_G17", false, "G17 (Garage gun)", "maingame");
	settings.Add("EthanCarKey", false, "Car Key", "maingame");
	settings.Add("EntranceHallKey", false, "Ox Statuette", "maingame");
	settings.Add("PendulumClock", false, "Clock Pendulum", "maingame");
	settings.Add("3CrestKeyA", false, "Blue Dog Head", "maingame");
	settings.Add("SilhouettePazzlePiece", false, "Wooden Statuette", "maingame");
	settings.Add("3CrestKeyB", false, "White Dog Head", "maingame");
	settings.Add("WorkroomKey", false, "Dissection Room Key", "maingame");
	settings.Add("3CrestKeyC", false, "Red Dog Head", "maingame");
	settings.Add("ChainSaw", false, "Chainsaw", "maingame");
	settings.Add("chainsawduel", false, "Finished chainsaw fight", "maingame");
	settings.Add("MorgueKey", false, "Scorpion Key", "maingame");
	settings.Add("c03_TrailerHouse", false, "Reached the trailer (first time)", "maingame");
	settings.Add("c03_OldHouse1FEntrance01", false, "Reached the Old House", "maingame");
	settings.Add("BurnerPartsA", false, "Burner Grip", "maingame");
	settings.Add("BurnerPartsB", false, "Burner Nozzle", "maingame");
	settings.Add("SilhouettePazzlePieceOldHouse", false, "Stone Statue", "maingame");
	settings.Add("Crank", false, "Crank", "maingame");
	settings.Add("TalismanKey", false, "Crow Key", "maingame");
	settings.Add("c03_OldHouse2FHallway02", false, "Entered Crow Door (after falling down hole)", "maingame");
	settings.Add("Lantern", false, "Lantern", "maingame");
	settings.Add("usedlantern", false, "Placed Lantern (to unlock door)", "maingame");
	settings.Add("SerumMaterialA", false, "D-Series Arm", "maingame");
	settings.Add("Magnum", false, "Magnum", "maingame");
	settings.Add("MasterKey", false, "Snake Key", "maingame");
	settings.Add("GrenadeLauncher", false, "Grenade Launcher", "maingame");
	settings.Add("LucasCardKey2", false, "Red Key Card", "maingame");
	settings.Add("LucasCardKey", false, "Blue Keycard", "maingame");
	settings.Add("c03_LeftArea2FTvRoom", false, "Reached Lucas TV room", "maingame");
	settings.Add("Battery", false, "Battery", "maingame");
	settings.Add("Candle", false, "Candle", "maingame");
	settings.Add("Valve", false, "Valve Handle", "maingame");
	settings.Add("Timebomb", false, "Timebomb", "maingame");
	settings.Add("SerumMaterialB", false, "D-Series Head", "maingame");
	settings.Add("SerumComplete", false, "Completed Serum", "maingame");
	settings.Add("hittheroadjack", false, "Injected Jack", "maingame");
	settings.Add("EvelynRadar1", false, "Mia Start", "maingame");
	settings.Add("FuseCh4", false, "Fuse 2 (ship)", "maingame");
	settings.Add("FoundFootage050", false, "Mia Videotape (picked up)", "maingame");
	settings.Add("videotapeend", false, "Mia Tape End", "maingame");
	settings.Add("EvOpener", false, "Lug Wrench", "maingame");
	settings.Add("EvCable", false, "Power Cable", "maingame");
	settings.Add("fuse3", false, "Retrieved Fuse (from door on ship)", "maingame");
	settings.Add("EvelynRadar4", false, "Mia Complete", "maingame");
	settings.Add("SerumTypeE", false, "Necrotoxin", "maingame");
	settings.Add("injectedbitch", false, "Injected Evie", "maingame");
	settings.Add("Handgun_Albert", false, "Albert Gun (Playtime's over)", "maingame");
	settings.Add("end", false, "End", "maingame");
	settings.Add("nah", false, "Not a Hero");
	settings.Add("c08_SaltMineCorridor01", false, "Reached the new section of the mine", "nah");
	settings.Add("KeyItem05Ch8", false, "Gear", "nah");
	settings.Add("KeyItem03Ch8", false, "Crank", "nah");
	settings.Add("Ch8CageKey", false, "Cage Key", "nah");
	settings.Add("c08_MiningRoom01", false, "Entered soldier 2's cell", "nah");
	settings.Add("Handgun_Albert_C", false, "Handgun (Professional mode only!)", "nah");
	settings.Add("AlbertHandgunBulletL", false, "Ramrods (first time, near night vision)", "nah");
	settings.Add("MineMasterKey", false, "Clown Key", "nah");
	settings.Add("Shotgun_Albert", false, "Shotgun (Professional mode only!)", "nah");
	settings.Add("c08_TrainPassage05", false, "Saved soldier 3 (triggers in room with ladder)", "nah");
	settings.Add("c08_MiningTunnel01", false, "Reached fat molded boss room", "nah");
	settings.Add("nah_bombgone", false, "Beat fat molded/Removed bomb (triggers after leaving area after removing bomb)", "nah");
	settings.Add("c08_ShieldMachine_Entra", false, "Entered the Blast Door", "nah");
	settings.Add("c08_MineTerminal01", false, "Escaped the explosion (post-horde)", "nah");
	settings.Add("c08_BossRoom01", false, "Reached the Lucas boss room", "nah");
	settings.Add("nah_end", false, "End", "nah");
	settings.Add("eoz", false, "End of Zoe");
	settings.Add("NumaItem030", false, "Cure for Type-E Infection", "eoz");
	settings.Add("eoz_usedcure", false, "Used Cure", "eoz");
	settings.Add("c09_CampSafeRoomInside", false, "Placed Zoe in Safe Room (triggers upon entering)", "eoz");
	settings.Add("c09_SteamBoat3F", false, "Reached the Boat", "eoz");
	settings.Add("NumaItem031", false, "Second Cure for Type-E Infection (on boat)", "eoz");
	settings.Add("c09_SteamBoatB1FCorridor01", false, "Defeated Jack (on boat)", "eoz");
	settings.Add("c09_MoldSwampGround05", false, "Made it through the Alligator Swamp", "eoz");
	settings.Add("c09_Cemetery", false, "Reached the Cemetery", "eoz");
	settings.Add("c09_Church", false, "Reached the Church", "eoz");
	settings.Add("CH9_WP001", false, "AMG-78", "eoz");
	settings.Add("c03_MainHouseHall", false, "Reached the Baker's Main Hall", "eoz");
	settings.Add("eoz_end", false, "End", "eoz");
}

init
{
	vars.splits = new HashSet<string>();
	vars.inventoryPtr = IntPtr.Zero;
	switch (modules.First().ModuleMemorySize)
	{
		case (241680384):
			version = "1.2";
			vars.inventoryPtr = 0x7091CA0;
			break;
		case (248446976):
			version = "1.3";
			vars.inventoryPtr = 0x70DADB0;
			break;
		case (272252928):
			version = "1.4";
			vars.inventoryPtr = 0x81E4148;
			break;
		case (342978560):
			version = "cerod";
			vars.inventoryPtr = 0x93352C0;
			break;
		default:
			version = "1.1";
			vars.inventoryPtr = 0x707FCD0;
			break;
	}


	// Track inventory IDs
	current.inventory = new string[20].Select((_, i) => {
		StringBuilder sb = new StringBuilder();
		IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x60, 0x20, 0x30 + (i * 8), 0x28, 0x80, 0x24).DerefOffsets(memory, out ptr);
		memory.ReadString(ptr, sb);
		return sb.ToString();
	}).ToArray();
}


start
{	
	if (current.map == old.map) { return false; }

	if (settings["nah"])
	{
		return (current.map == "c04_CavePassage01" && current.inventory[0] == "CKnife" || current.map == "c04_Ship3FInfirmaryPast");
	}
	if (settings["eoz"])
	{
		return (current.map == "sm0878_Carpet08A" || current.map == "c04_Ship3FInfirmaryPast");
	}

	return current.map == "c04_Ship3FInfirmaryPast";
}

update
{
	

	// Update inventory IDs
	current.inventory = new string[20].Select((_, i) => {
		StringBuilder sb = new StringBuilder();
		IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x60, 0x20, 0x30 + (i * 8), 0x28, 0x80, 0x24).DerefOffsets(memory, out ptr);
		memory.ReadString(ptr, sb);
		return sb.ToString();
	}).ToArray();

  vars.isdead = (current.isdying == 0 ? 1 : 0);
	if (timer.CurrentPhase == TimerPhase.NotRunning) { vars.splits.Clear(); }
}

split
{
	// Item splits
	string[] currentInventory = (current.inventory as string[]);
	string[] oldInventory = (old.inventory as string[]); // throws error first update, will be fine afterwards.
	if (!currentInventory.SequenceEqual(oldInventory))
	{
		print("test");
		string[] delta = (currentInventory as string[]).Where((v, i) => v != oldInventory[i]).ToArray();
		print(String.Join(", ", delta));

		foreach (string item in delta)
		{
			if (!vars.splits.Contains(item))
			{
				vars.splits.Add(item);
				return settings[item];
			}
		}
	}

	// Map splits
	if (current.map != old.map)
	{
		if (!vars.splits.Contains(current.map))
		{
			vars.splits.Add(current.map);
			return settings[current.map];
		}
	}

	// Custom split example
	if (current.map == "c01_Outside01" && current.inventory[0] != "MailMia" && !vars.splits.Contains("welcome2family"))
	{
		vars.splits.Add("welcome2family");
		return true;
	}
}

isLoading
{
	if (current.isPaused != old.isPaused) { return current.isPaused == 1; }
}