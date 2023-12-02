//Resident Evil 7 Autosplitter
//Originally by CursedToast 1/28/2017
//Maintained by TheDementedSalad since 2022
//Last updated 2 Dec 2013

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

state("re7", "CeroD 20.5.0.2")
{
	byte Chapter: 0x9387430, 0x54;
	int gamePauseState: 0x9387430, 0x104;
	int isLoading: 0x9387430, 0x1A4;
	string128 Events: 0x9351E20, 0x98, 0x80, 0x58, 0x10, 0x24;
	string128 map : 0x934CCA0, 0x700, 0x0;
}

state("re7", "12/17 Update")
{
	byte Chapter: 0x81FA818, 0x54;
	int gamePauseState: 0x81FA818, 0x104;
	int isLoading: 0x81FA818, 0x1A4;
	string128 Events: 0x81EA150, 0x98, 0x80, 0x58, 0x20, 0x24;
	string128 map : 0x81E9B00, 0x700, 0x0;
	
	byte hp21: 0x81F79A0, 0x70;
	
	int Jack55Bonus : 0x82353B8, 0x70, 0x58;
	int Jack55IGT : 0x82353B8, 0x70, 0x98;
	int Jack55Extra : 0x82353B8, 0x70, 0xC0;
	byte Jack55Start: 0x82353B8, 0x70, 0xC8;
	byte Jack55Level : 0x8224BB0, 0x50, 0x268, 0x30, 0x30, 0x100, 0x40, 0x1C0;
	byte Jack55End : 0x8224BB0, 0xB0;
}

state("re7", "Endof DX11")
{
	byte Chapter: 0x8207330, 0x54;
	int gamePauseState: 0x8207330, 0x104;
	int isLoading: 0x8207330, 0x1A4;
	string128 Events: 0x81F7948, 0x98, 0x80, 0x58, 0x20, 0x24;
	string128 map : 0x81F7218, 0x700, 0x0;
	
	byte hp21: 0x82052B0, 0x70;
	
	int Jack55Bonus : 0x82353B8, 0x70, 0x58;
	int Jack55IGT : 0x82353B8, 0x70, 0x98;
	int Jack55Extra : 0x82353B8, 0x70, 0xC0;
	byte Jack55Start: 0x82353B8, 0x70, 0xC8;
	byte Jack55Level : 0x8232148, 0x50, 0x268, 0x30, 0x30, 0x100, 0x40, 0x1C0;
	byte Jack55End : 0x8232148, 0xB0;
}

state("re7", "NextGen")
{
	byte Chapter: 0x8FC42F8, 0x54;
	int gamePauseState: 0x8FC42F8, 0x104;
	int isLoading: 0x8FC42F8, 0x1A4;
	string128 Events: 0x8F8D9A8, 0x98, 0x80, 0x58, 0x10, 0x14;
	string128 map : 0x8F7DE00, 0x960, 0x0;
	
	byte hp21: 0x8FBD480, 0x70;
	
	int Jack55Bonus : 0x8F80FF8, 0x70, 0x58;
	int Jack55IGT : 0x8F80FF8, 0x70, 0x98;
	int Jack55Extra : 0x8F80FF8, 0x70, 0xC0;
	int Jack55Start : 0x8F80FF8, 0x70, 0xC8;
	byte Jack55Level : 0x8224BB0, 0x6C8, 0x270, 0xB8, 0x3D0, 0x80, 0x1C4;
	byte Jack55End : 0x8224BB0, 0xB0;
}

state("re7", "6/10/22")
{
	byte Chapter: 0x8FC4478, 0x54;
	int gamePauseState: 0x8FC4478, 0x104;
	int isLoading: 0x8FC4478, 0x1A4;
	string128 Events: 0x8F8DB28, 0x98, 0x80, 0x58, 0x10, 0x14;
	string128 map : 0x8F7DF80, 0x960, 0x0;
	
	byte hp21: 0x8FBD600, 0x70;
	
	int Jack55Bonus : 0x8F81178, 0x70, 0x58;
	int Jack55IGT : 0x8F81178, 0x70, 0x98;
	int Jack55Extra : 0x8F81178, 0x70, 0xC0;
	int Jack55Start : 0x8F81178, 0x70, 0xC8;
	byte Jack55Level : 0x8F81178, 0x6C8, 0x270, 0xB8, 0x3D0, 0x80, 0x1C4;
	byte Jack55End : 0x8F81178, 0xB0;
}

state("re7", "9/5/23")
{	
	byte Chapter: 0x8FF2790, 0x54;													//app.GameManager
	int gamePauseState: 0x8FF2790, 0x104;											//""
	int isLoading: 0x8FF2790, 0x1A4;												//""
	string128 Events: 0x8FBBD08, 0x98, 0x80, 0x58, 0x10, 0x14;						//Start new game & search c00e00_00_pl2000, address always ends in 4. 0x14 for DX12 0x24 for DX11
	string128 map: 0x8FAC0B0, 0x960, 0x0;
	
	byte hp21: 0x8FEB238, 0x70;
	
	int Jack55Bonus : 0x8FAF3A8, 0x70, 0x58;
	int Jack55IGT : 0x8FAF3A8, 0x70, 0x98;
	int Jack55Extra : 0x8FAF3A8, 0x70, 0xC0;
	int Jack55Start : 0x8FAF3A8, 0x70, 0xC8;
	byte Jack55Level : 0x8FAF3A8, 0x6C8, 0x270, 0xB8, 0x3D0, 0x80, 0x1C4;
	byte Jack55End : 0x8FAF3A8, 0xB0;
}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
	vars.Helper.Settings.CreateFromXml("Components/RE7.Settings.xml");

	vars.TotalTimeInSeconds = 0f;
	
	// Asks user to change to game time if LiveSplit is currently set to Real Time.
		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses In Game Time as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Resident Evil 7",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );

        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

init
{
	vars.splits = new HashSet<string>();
	vars.inventoryPtr = IntPtr.Zero;
	vars.fuse3PickedUp = 0;
	vars.fuse2PickedUp = 0;

	vars.Jack55Full = 0;
	vars.Jack55Timer = 0;
	vars.Jack55Finish = 0;
	
	string md5 = "";
    try {
        md5 = (string)vars.Helper.GetMD5Hash();
    } catch {
        // Failed to open file for MD5 computation.
    }
	
	switch (md5) {
			case "C505F2F8DD88C1478DA4B98FD49D7991":
				version = "12/17 Update";
				vars.inventoryPtr = 0x81F1308;
			break;
			case "9EDD76273F6653F2B39DE5B9CBB6EFA4":
				version = "NextGen";
				vars.inventoryPtr = 0x8FB9B48;
			break;
			case "401BA759C4F1FE95ED06B33084FAA187":
				version = "6/10/22";
				vars.inventoryPtr = 0x8FB9CC8;
			break;
			case "43303BA085DE21ADE83D7D1FB2CC6B86":
				version = "9/5/23";
				vars.inventoryPtr = 0x8FE7A88;
			break;
        default:
            // No version found with hash, fallback to memorySize
            switch ((int)vars.Helper.GetMemorySize()) {
			case (162795520):
				version = "CeroD 20.5.0.2";
				vars.inventoryPtr = 0x9357E00;
				break;
			case (142331904):
				version = "Endof DX11";
				vars.inventoryPtr = 0x81FEF90;
				break;
		}
        break;
	}

	// Track inventory IDs
	if (version == "NextGen" || version == "6/10/22" || version == "9/5/23"){
		current.inventory = new string[20].Select((_, i) => {
		StringBuilder sb = new StringBuilder(300);
		IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x60, 0x10, 0x20 + (i * 8), 0x18, 0x80, 0x14).DerefOffsets(memory, out ptr);
		memory.ReadString(ptr, sb);
		return sb.ToString();
		}).ToArray();
	}
	
	else{
		current.inventory = new string[20].Select((_, i) => {
		StringBuilder sb = new StringBuilder(300);
		IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x60, 0x20, 0x30 + (i * 8), 0x28, 0x80, 0x24).DerefOffsets(memory, out ptr);
		memory.ReadString(ptr, sb);
		return sb.ToString();
		}).ToArray();
	}
}

onStart
{
	vars.TotalTimeInSeconds = 0f;
	
	if(settings["55th"]){
		vars.Helper.Texts["Total Time"].Left = "Time:";
		vars.Helper.Texts["Total Time"].Right = "00:00.000";
	}
}

start
{	
	return current.Events == "c00e00_00_pl2000" || // Main Game
			current.Chapter == 5 && (current.inventory[0] == "Knife" || current.inventory[1] == "Knife") && current.map == "c03_MainHouse1FWash" || // No Guest House
			current.map == "c04_CavePassage01" && current.inventory[0] == "CKnife" || // Not a Hero
			current.Events == "c09e11_00_pl9000" || // End of Zoe
			current.Events == "c07e40_00_pl3400" || // Daughters
			current.Chapter == 29 && current.Events == "c07e10_00_pl3000" || // Bedroom
			current.Chapter == 34 && current.map == "c03_OldHouse1FBridge01" && current.inventory[0] == "Knife" || // Ethan Must Die
			(current.Chapter == 22 || current.Chapter == 23 || current.Chapter == 24 || current.Chapter == 25) && current.Jack55Start == 1 && old.Jack55Start == 0 || // Jack's 55th
			current.Events == "c07e25_50_pl3000" || "c07e25_03_pl3000"; // 21
}

update
{
	//print(modules.First().ModuleMemorySize.ToString());
	
	// Track inventory IDs
	if (version == "Next Gen" || version == "6/10/22" || version == "9/5/23"){
		current.inventory = new string[20].Select((_, i) => {
		StringBuilder sb = new StringBuilder(300);
		IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x60, 0x10, 0x20 + (i * 8), 0x18, 0x80, 0x14).DerefOffsets(memory, out ptr);
		memory.ReadString(ptr, sb);
		return sb.ToString();
		}).ToArray();
	}
	
	else{
		current.inventory = new string[20].Select((_, i) => {
		StringBuilder sb = new StringBuilder(300);
		IntPtr ptr;
		new DeepPointer(vars.inventoryPtr, 0x60, 0x20, 0x30 + (i * 8), 0x28, 0x80, 0x24).DerefOffsets(memory, out ptr);
		memory.ReadString(ptr, sb);
		return sb.ToString();
		}).ToArray();
	}

	if (timer.CurrentPhase == TimerPhase.NotRunning){ 
		vars.splits.Clear();
		vars.fuse2PickedUp = 0;
		vars.fuse3PickedUp = 0;
		vars.Jack55Full = 0;
		vars.Jack55Finish = 0;
		vars.Jack55Timer = 0;
	}
	
	if(settings["55th"]){

		if(current.Jack55Level == 0 || current.Jack55Level == 2 || current.Jack55Level == 5){
			vars.Jack55Timer = 900000;
		}
		if(current.Jack55Level == 1){
			vars.Jack55Timer = 600000;
		}
		if(current.Jack55Level == 3){
			vars.Jack55Timer = 300000;
		}
		if(current.Jack55Level == 4){
			vars.Jack55Timer = 480000;
		}
		
		if(current.Chapter == 26 && old.Chapter != 26){
			vars.Jack55Full = current.Jack55IGT + current.Jack55Extra - current.Jack55Bonus;
			vars.Jack55Finish = vars.Jack55Timer - vars.Jack55Full;
			vars.TotalTimeInSeconds += vars.Jack55Finish;
			
			vars.Helper.Texts["Total Time"].Right = TimeSpan.FromMilliseconds(vars.TotalTimeInSeconds).ToString(@"mm\:ss\.fff");
		}
	}
	
	if (!settings["55th"]){
		vars.Helper.Texts.RemoveAll();
	}
}

split
{
	// Item splits
	string[] currentInventory = (current.inventory as string[]);
	string[] oldInventory = (old.inventory as string[]); // throws error first update, will be fine afterwards.
	if (!currentInventory.SequenceEqual(oldInventory)){
		string[] delta = (currentInventory as string[]).Where((v, i) => v != oldInventory[i]).ToArray();

		foreach (string item in delta){
			if (item == "FuseCh4"){
				if (vars.fuse2PickedUp == 0 && current.map != "c04_Ship1FCorridor"){
					vars.fuse2PickedUp = 1;
					return settings["fuse2"];
				}
				else if (vars.fuse3PickedUp == 0 && current.map == "c04_Ship1FCorridor"){
					if (settings["fuse2"]){
						if (vars.fuse2PickedUp == 1){
							vars.fuse3PickedUp = 1;
							return settings["fuse3"];
						}
					}
					else{
						vars.fuse3PickedUp = 1;
						return settings["fuse3"];
					}
				}
			}
			else if (!vars.splits.Contains(item)){
				vars.splits.Add(item);
				return settings[item];
			}
		}
	}
	
	//Removed item splits
	var removedItems = oldInventory.Except(currentInventory);

	if (removedItems.Contains("ChainSaw") && current.isLoading == 100){
		if (!vars.splits.Contains("removedSaw")){
			vars.splits.Add("removedSaw");
			return settings["chainsawduel"];
		}
	}

	if (currentInventory.Count(v => v == "SerumComplete") == 1){
		if (!vars.splits.Contains("injectedJack")){
			vars.splits.Add("injectedJack");
			return settings["hittheroadjack"];
		}
	}

	if (removedItems.Contains("Lantern") && current.isLoading == 100){
		if (!vars.splits.Contains("usedTheLantern")){
			vars.splits.Add("usedTheLantern");
			return settings["usedlantern"];
		}
	}

	if (removedItems.Contains("SerumTypeE") && current.isLoading == 100 && current.map == "c04_c013F"){
		if (!vars.splits.Contains("injectedEvieWithSerum")){
			vars.splits.Add("injectedEvieWithSerum");
			return settings["injectedbitch"];
		}
	}

	if (removedItems.Contains("MachineGun")){
		if (!vars.splits.Contains("videotapeend")){
			vars.splits.Add("videotapeend");
			return settings["videotapeend"];
		}
	}

	// Map splits
	if (current.map != old.map){
		if (current.map == "c08_MiningPassage02_static" && old.map == "c08_MiningTunnel01" && !vars.splits.Contains(current.map) || current.map == "c08_MiningPassage02" && old.map == "c08_MiningTunnel01" && !vars.splits.Contains(current.map)){
			vars.splits.Add(current.map);
			return settings["nah_bombgone"];
		}
		else if (!vars.splits.Contains(current.map)){
			vars.splits.Add(current.map);
			return settings[current.map];
		}
	}

	if (old.map != "c01_Outside01" && current.map == "c01_Outside01" && current.inventory[0] != "MailMia" && settings["100family"] == false && !vars.splits.Contains("welcome2family"))
	{
		vars.splits.Add("welcome2family");
		return settings["welcome2family"];
	}
	
	if (current.map == "c03_MainHouse1FLDK" && !vars.splits.Contains("100family"))
	{
		vars.splits.Add("100family");
		return settings["100family"];
	}
	
	if (current.map == "c03_TrailerHouse" && current.Chapter == 4 && !vars.splits.Contains("Trailer1"))
	{
		vars.splits.Add("Trailer1");
		return settings["Trailer1"];
	}
	
	if(current.map == "c04_ShipB2Corridor01Past" && !vars.splits.Contains("DownElevator"))
		{
		vars.splits.Add("DownElevator");
		return settings["DownElevator"];
	}
	
	if(current.map == "c04_Ship2FCorridorCPast" && vars.splits.Contains("DownElevator") && !vars.splits.Contains("UpElevator"))
		{
		vars.splits.Add("UpElevator");
		return settings["UpElevator"];
	}
	
	if (current.map == "c08_BossRoom01" && !vars.splits.Contains("lucsbossRoom"))
	{
		vars.splits.Add("lucsbossRoom");
		return settings["lucsbossRoom"];
	}
	
	//Events splits
	if(settings["" + current.Events] && !vars.splits.Contains(current.Events)){
		vars.splits.Add(current.Events);
		return true;
	}

	//End splits
	if (removedItems.Contains("Handgun_Albert") && !vars.splits.Contains("end")){
			vars.splits.Add("end");
			return true;
		}
		
    if (old.map == "c08_BossRoom01" && current.inventory[0] != old.inventory[0] && !vars.splits.Contains("nah_end")){
		vars.splits.Add("nah_end");
		return settings["nah_end"];
	}

    if(current.map == "c03_MainHouseHall" && current.inventory[0] != "NumaItem031" && !vars.splits.Contains("eoz_end")){
		vars.splits.Add("eoz_end");
		return settings["eoz_end"];
	}
	
	if(settings["55th"]){
		if(current.Jack55End == 1 && old.Jack55End == 0){
			return true;
		}
	}
	
	if((current.Events == "c07e46_00_pl3400" || current.Events == "c07e47_00_pl3400") && !vars.splits.Contains("daught_end")){
		vars.splits.Add("daught_end");
		return true;
	}
	
	if (removedItems.Contains("MasterKey") && !vars.splits.Contains("bed_end")){
		vars.splits.Add("bed_end");
		return true;
	}
	
	if (current.hp21 == 14 && current.Events == "c07e25_03_pl3000" && !vars.splits.Contains("21_end")){
		vars.splits.Add("21_end");
		return true;
	}
}

isLoading
{	
	if(settings["55th"]){
		return current.gamePauseState != 0 && current.gamePauseState != 262400 && current.gamePauseState != 8 && current.gamePauseState != 262144 || current.Jack55End == 1;
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
	
	if (settings["bed"]){
		return current.Chapter == 29 && old.Chapter == 28;
	}
	
	if (settings["nah"]){
		return current.gamePauseState == 0 && old.Chapter == 28;
	}
	
	if (settings["21"]){
		return current.Chapter == 30 && old.Chapter == 28;
	}
}
