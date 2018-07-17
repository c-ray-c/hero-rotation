--- ============================ HEADER ============================
--- ======= LOCALIZE =======
  -- Addon
  local addonName, addonTable = ...;
  -- HeroRotation
  local HR = HeroRotation;
  
  local HL = HeroLib;
  -- File Locals
  local GUI = HL.GUI;
  local CreateChildPanel = GUI.CreateChildPanel;
  local CreatePanelOption = GUI.CreatePanelOption;
  local CreateARPanelOption = HR.GUI.CreateARPanelOption;
  local CreateARPanelOptions = HR.GUI.CreateARPanelOptions;

--- ============================ CONTENT ============================
  -- All settings here should be moved into the GUI someday.
  HR.GUISettings.APL.DemonHunter = {
    Commons = {
      -- {Display OffGCD as OffGCD, ForceReturn}
      OffGCDasOffGCD = {
        Racials = true,
        -- Abilities
        Disrupt = true,
      },
      UseTrinkets = true,
      UsePotions  = true
    },
    Vengeance = {
      -- {Display OffGCD as OffGCD, ForceReturn}
      OffGCDasOffGCD = {
        -- Abilities
        DemonSpikes = true,
        InfernalStrike = true,
      }
    },
    Havoc = {
      -- {Display OffGCD as OffGCD, ForceReturn}
      FelRushDisplayStyle = "Main Icon",
      OffGCDasOffGCD = {
        -- Abilities
        Metamorphosis = true,
        Nemesis = true,
      },
    }
  };

  HR.GUI.LoadSettingsRecursively(HR.GUISettings);
  local ARPanel = HR.GUI.Panel;
  local CP_DemonHunter = CreateChildPanel(ARPanel, "DemonHunter");
  local CP_Havoc = CreateChildPanel(CP_DemonHunter, "Havoc");
  local CP_Vengeance = CreateChildPanel(CP_DemonHunter, "Vengeance");
  
  CreateARPanelOptions(CP_DemonHunter, "APL.DemonHunter.Commons");
  CreatePanelOption("CheckButton", CP_DemonHunter, "APL.DemonHunter.Commons.UseTrinkets", "Use Trinkets", "Use Trinkets as part of the rotation");
  CreatePanelOption("CheckButton", CP_DemonHunter, "APL.DemonHunter.Commons.UsePotions", "Use Potions", "Use Potions as part of the rotation");
  
  CreateARPanelOptions(CP_Vengeance, "APL.DemonHunter.Vengeance");

  CreatePanelOption("Dropdown", CP_Havoc, "APL.DemonHunter.Havoc.FelRushDisplayStyle", {"Main Icon", "Suggested", "Cooldown"}, "Fel Rush Display Style", "Define which icon display style to use for Fel Rush.");
  CreateARPanelOptions(CP_Havoc, "APL.DemonHunter.Havoc");
