ELSPro = ELSPro or {}  --Test

-- ==========================================================
-- FRAMEWORK CONFIGURATION (ESX / QBCore)
-- ==========================================================
ELSPro.Framework = "Standalone" -- Optionen: "ESX", "QBCore", "Standalone"

-- Debug Modus (für Prop-Positionierung)
ELSPro.Debug = false

-- Job Einschränkung (Nur wenn Framework auf ESX oder QBCore steht)
ELSPro.JobRequired = false
ELSPro.AllowedJobs = {
    ['police'] = true,
    ['ambulance'] = true,
    ['mechanic'] = false
}

-- ==========================================================
-- VOICE & MEGAPHONE CONFIGURATION
-- ==========================================================
ELSPro.VoiceSystem = "pma-voice" -- "pma-voice" (Standard), "saltychat", "tobii", "mumble-voip"
ELSPro.MegaphoneKey = "MINUS" -- Taste für Durchsage (Toggle Mode)
ELSPro.MegaphoneRange = 120.0 -- Reichweite der Durchsage in Metern (Sirenen sind meist lauter/weiter)
ELSPro.MegaphoneLoopback = true -- Wenn TRUE, hörst du dich selbst (Echo/Loopback), um die Ansage zu kontrollieren.
ELSPro.SwitchColorKey = "O" -- Taste für Orange/Blau Umschaltung


-- ==========================================================
-- TASTENBELEGUNG / KEY MAPPINGS
-- ==========================================================
ELSPro.Keys = {
    ToggleLight = "Q",          -- Blaulicht an/aus
    RearWarn    = "U",          -- Heckwarner
    SceneLight  = "OEM_7",      -- Umfeldbeleuchtung (Ä/OEM_7)
    FrontFlash  = "LMENU",      -- Frontblitzer (Linkes Alt)
    AuxBeacon   = "RBRACKET"    -- Zusatz-Kennleuchte (+)
}


-- ==========================================================
-- ADMIN CONFIGURATION (ACE PERMISSIONS)
-- ==========================================================
-- Der Zugriff auf /els_config wird nun über ACE Permissions geregelt!
-- Trage folgendes in deine server.cfg ein:
--
-- add_ace group.admin els_pro.config allow
--
-- Oder für einzelne Spieler:
-- add_ace identifier.steam:1100001xxxxxx els_pro.config allow
-- ==========================================================

-- ==========================================================
-- TABLET BUTTON DEFINITIONEN
-- Füge dies in deine config.lua ein, damit es im Tablet erscheint!
-- ==========================================================
ELSPro.ButtonList = {
    { label = "Blaulicht",      action = "toggle_light" },
    { label = "Heckwarner",     action = "toggle_rear" },
    { label = "Umfeld",         action = "toggle_scene" },
    { label = "Frontblitzer",   action = "toggle_front" },
    { label = "Sirene Stadt",   action = "siren_1" },
    { label = "Sirene Land",    action = "siren_2" },
    { label = "Sirene Press",   action = "siren_3" },
    { label = "Muster (Alle)",  action = "pattern_cycle" }, -- NEU: Schaltet ALLE definierten Listen weiter
    { label = "Motor an/aus",   action = "toggle_engine" },
    { label = "Zusatzkennleuchte",   action = "toggle_aux" },
    { label = "Reparieren",     action = "repair_veh" }
}

-- ==========================================================
-- BEIFAHRER KONTROLLE
-- ==========================================================
ELSPro.PassengerControl = {
    Enabled = true,           -- Soll der Beifahrer (Sitz 0) das ELS bedienen dürfen?
    AllowedActions = {        -- Welche Funktionen sind erlaubt?
        ['toggle_light']    = true,  -- Blaulicht
        ['toggle_rear']     = true,  -- Heckwarner
        ['toggle_scene']    = true,  -- Umfeld
        ['toggle_front']    = true,  -- Frontblitzer
        ['toggle_matrix']   = true,  -- Matrix Anzeige (NEU)
        ['siren_1']         = true,  -- Sirene 1
        ['siren_2']         = true,  -- Sirene 2
        ['siren_3']         = true,  -- Sirene 3
        ['pattern_cycle']   = true,  -- Muster umschalten (Alle)
        ['pattern_1']       = true,  -- Muster Ex 1
        ['pattern_2']       = true,  -- Muster Ex 2
        ['pattern_3']       = true,  -- Muster Ex 3
        ['pattern_4']       = true,  -- Muster Ex 4
        ['toggle_engine']   = false, -- Motor
        ['repair_veh']      = false, -- Reparatur
    }
}
-- Welches Layout soll geladen werden, wenn das Auto kein zugewiesenes Layout hat?
-- (Diesen Namen musst du einmal Ingame erstellen und speichern!)
ELSPro.DefaultLayout = "Standard"

-- ==========================================================
-- 2. BLITZER / SPEEDCAMERA INTEGRATION
-- ==========================================================
ELSPro.NoFlashOnBlueLight = false -- Wenn TRUE, werden Blitzer informiert, wenn Blaulicht an ist.

-- ==========================================================
-- 1. GLOBALE BLINKMUSTER
-- 1 = AN (50ms), 0 = AUS (50ms)
-- ==========================================================

ELSPro.Debug = false  -- <--- HIER AUF TRUE SETZEN ZUM EINSTELLEN!

ELSPro.Patterns = {
    -- Blaulicht --
    ['double']      = {1, 0, 1, 0, 0, 0, 0, 0, 0, 0}, 
    ['double_inv']  = {0, 0, 0, 0, 0, 1, 0, 1, 0, 0},
    ['rapid']       = {1, 0, 1, 0, 1, 0, 0, 0},
    ['single']      = {1, 1, 1, 0, 0, 0, 0, 0},
    ['steady']      = {1}, 
    ['wigwag_a']    = {1, 1, 1, 1, 0, 0, 0, 0},
    ['wigwag_b']    = {0, 0, 0, 0, 1, 1, 1, 1},
    ['v47_double_A'] = {1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    ['v47_double_B'] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0}, 
    ['v47_double_C'] = {0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    ['matrix'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    ['matrix_inv'] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    ['tree'] = {1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0},
    ['tree_inv'] = {0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1}, 

    -- HWS --
    ['heck_hyper'] = {1, 0},
    ['heck_rapid'] = {1, 0, 1, 0, 1, 0, 0, 0, 0, 0},
    ['heck_aggro_a'] = {1, 0, 1, 0, 0, 0, 0, 0},
    ['heck_aggro_b'] = {0, 0, 0, 0, 1, 0, 1, 0}  
}

-- ==========================================================
-- SIREN SYSTEM SELECTION
-- ==========================================================
-- Wähle hier das Sirenen-System:
-- "WM"          = WM Serversirens (Benötigt DLC_WMSIRENS)
-- "ServerSided" = ServerSidedSoundsandSirens (oder andere globale Sounds)
ELSPro.SirenSystem = "WM"

-- Konfiguration für WM Serversirens
ELSPro.WM = {
    defaultTones = { [1]="SIREN_ALPHA", [2]="SIREN_BRAVO", [3]="SIREN_CHARLIE", [4]="SIREN_DELTA", [5]="SIREN_ECHO", [6]="SIREN_FOXTROT", [7]="SIREN_GOLF", [8]="SIREN_HOTEL" },
    audioBank = {
    "DLC_WMSIRENS\\SIRENPACK_ONE",
    "DLC_WMSIRENS\\SIRENPACK_TWO",
    "CUSTOM_SIRENS\\BANK_A"
    },
    soundset = {
    "SIRENPACK_ONE_SET",
    "SIRENPACK_TWO_SET",
    "SIRENPACK_ONE_SET"
    },
}

-- Konfiguration für ServerSidedSoundsandSirens
ELSPro.ServerSided = {
    -- Hier die Sound-Namen eintragen, die dein Sound-Pack nutzt:
    defaultTones = { [1]="SIREN_1", [2]="SIREN_2", [3]="SIREN_3" }, 
    
    -- Soundsets: Kann ein String sein (gilt für alle) oder eine Tabelle (pro Tone)
    -- Beispiel Tabelle: soundset = { [1]="SET_A", [2]="SET_B", [3]="SET_A" }
    soundset = nil, 

    -- AudioBanks: Kann ein String sein oder eine Tabelle (Liste)
    -- Beispiel Tabelle: audioBank = { "DLC_WMSIRENS\\BANK1", "DLC_WMSIRENS\\BANK2" }
    audioBank = nil 
}

-- ==========================================================
-- BILDER / HINTERGRÜNDE
-- ==========================================================
-- Hier kannst du zusätzliche PNG-Dateien aus dem "bedienteile" Ordner eintragen.
-- Diese erscheinen dann im Ingame-Editor (/els_config).
-- WICHTIG: Die Dateien müssen auch in der fxmanifest.lua unter 'files' eingetragen sein (z.B. 'bedienteile/*.png').
ELSPro.ExtraImages = {
    "be200.png",
    "be200m.png",
    "be304.png",
    "be308.png",
    "be312.png",
    "be600.png",
    "hbe300.png",
    "bl_an.png",
    "bl_aus.png",
    "estelle_an.png",
    "estelle_aus.png",
    "fb_an.png",
    "fb_aus.png",
    "land_an.png",
    "land_aus.png",
    "matrix_an.png",
    "matrix_aus.png",
    "press_an.png",
    "press_aus.png",
    "rws_an.png",
    "rws_aus.png",
    "stadt_an.png",
    "stadt_aus.png",
    "umf_an.png",
    "umf_aus.png"
}

ELSPro.Vehicles = ELSPro.Vehicles or {}

-- ==========================================================
--  FAHRZEUG KONFIGURATION
-- ==========================================================

ELSPro.Vehicles[GetHashKey("ExampleVehicle")] = {
    
    layout = "Test1", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = true, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 10, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [1] = {"v47_double_A", "rapid", "steady"},    -- BEISPIEL: Mehrere Muster (umschaltbar)
        [2] = "v47_double_B",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
        [3] = "v47_double_A",    -- Frontblitzer (schnell)
        [4] = "v47_double_B",    -- Frontblitzer (schnell)
    },

    -- Frontblitzer
    frontExtras = {
        [5] = "v47_double_C",
        [6] = "v47_double_C"
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [7] = "heck_aggro_a",
        [8] = "heck_aggro_a"
    },

    -- UMFELD
    sceneExtras = { 12 },

    -- MATRIX (NEU)
    matrixExtras = { 10 }, -- Beispiel Extra 10, falls vorhanden. Sonst anpassen!

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = 1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
        [2] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [3] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [4] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [5] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.00,  y = 2.95,   z = 0.30 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [7] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.05,  y = -4.00,   z = 2.25 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 3.0
            }
        },
        [12] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.0,  y = -0.2,  z = 1.20 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            }
        }
    }
}

-- Nicht ELS Fahrzeug mit drauf gespwnter Kennleuchte, Model Dateien in HM_ELSPro/stream
ELSPro.Vehicles[GetHashKey("ExampleVehicle2")] = {
    
    layout = "Test1", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    attachedProp = {
    model = "kennleuchtew",
    offset = { x=-0.550, y=-0.150, z=1.320 },
    
    -- Konfiguration für BLAU (Standard)
    extras = {
        [2] = false, -- Orange aus
        -- Extra 1 blitzt schnell (nutzt Pattern "PRE_H_FAST" aus patterns.lua)
        [1] = "v47_double_B", 
    },

    -- Konfiguration für ORANGE (wenn umgeschaltet)
    amberExtras = {
        [1] = false, -- Blau aus
        
        -- Extra 4 blitzt orange (gleichzeitiges Blitzen)
        [2] = "v47_double_B",
    }
    },

    lightExtras = {
        [1] = {"v47_double_A", "rapid", "steady"},    -- BEISPIEL: Mehrere Muster (umschaltbar)
    },

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                offset    = { x = -0.55,  y = -0.15,   z = 1.60 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
        [2] = {
            {
                type = "point",
                offset    = { x = -0.55,  y = -0.15,   z = 1.60 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
    }
}

--Feuerwehr
ELSPro.Vehicles[GetHashKey("gravelkdow")] = {
    
    layout = "KDOW", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = false, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 13, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [1] = "tree",    -- BEISPIEL: Mehrere Muster (umschaltbar)
        [2] = "tree_inv",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
    },

    -- Frontblitzer
    frontExtras = {
        [3] = "tree",
        [4] = "tree",
        [5] = "tree"
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [6] = "heck_aggro_a",
        [7] = "heck_aggro_a"
    },

    -- UMFELD
    sceneExtras = { 10 },

    -- MATRIX (NEU)
    matrixExtras = { 13 }, -- Beispiel Extra 10, falls vorhanden. Sonst anpassen!

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                offset    = { x = -0.65999966859818,  y = -0.36999973654747,   z = 1.2399991750717 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [2] = {
            {
                type = "point",
                offset    = { x = 0.65999966859818,  y = -0.36999973654747,   z = 1.2399991750717 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [3] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.33999997377396,  y = 2.2499983310699,   z = 0.11999998241663 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.33999997377396,  y = 2.2499983310699,   z = 0.11999998241663 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [4] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.33999997377396,  y = 2.2499983310699,   z = 0.11999998241663 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.33999997377396,  y = 2.2499983310699,   z = 0.11999998241663 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [5] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.33999997377396,  y = 2.2499983310699,   z = 0.11999998241663 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.33999997377396,  y = 2.2499983310699,   z = 0.11999998241663 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [7] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.0,  y = -0.74999959468842,   z = -0.4399991750717 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 3.0
            }
        },
        [10] = {
            {
                type = "point",
                offset    = { x = 0.73999959230423,  y = -0.34999978542328,  z = 1.1399992704391 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = -0.73999959230423,  y = -0.34999978542328,  z = 1.1399992704391 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            }
        }
    }
}
ELSPro.Vehicles[GetHashKey("fladder24")] = {
    
    layout = "BF", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = false, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 13, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [1] = "double",   -- BEISPIEL: Mehrere Muster (umschaltbar)
        [4] = "double",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
        [3] = "double",    -- Frontblitzer (schnell)
        [4] = "double",    -- Frontblitzer (schnell)
        [6] = "tree"
    },

    -- Frontblitzer
    frontExtras = {
        [5] = "tree"
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [7] = "heck_aggro_a",
        [8] = "heck_aggro_b"
    },

    -- UMFELD
    sceneExtras = { 10 },

    -- MATRIX (NEU)
    --matrixExtras = { 13 }, -- Beispiel Extra 10, falls vorhanden. Sonst anpassen!

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.849996805191, z = -0.36999985575676 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = 0.81999951601028,  y = 3.1199975013733,   z = 1.8299986124039 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
	},
        [4] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = -0.81999951601028,  y = 3.1199975013733,   z = 1.8299986124039 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
	},
        [5] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.41999986767769,  y = 3.9299967288971,   z = 0.0 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 15.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.41999986767769,  y = 3.9299967288971,   z = 0.0 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 15.0,
                intensity = 2.5
            }
        },
        [6] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.81999945640564,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 10.0,
                intensity = 1.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.81999945640564,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 10.0,
                intensity = 1.5
            }
        },
        [7] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.11999992281199,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.11999992281199,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            }
        },
        [8] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.47999978065491,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.47999978065491,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            }
        },
        [10] = {
            {
                type = "point",
                offset    = { x = 0.0,  y = -4.4500064849854,  z = 0.36000001430511 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = 1.2699990272522,  y = -2.2299981117249,  z = 0.39999997615814 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = -1.2699990272522,  y = -2.2299981117249,  z = 0.39999997615814 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = 1.2699990272522,  y = 1.1599992513657,  z = 1.3599990606308 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = -1.2699990272522,  y = 1.1599992513657,  z = 1.3599990606308 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
        }
    }
}
   -- BFRD
ELSPro.Vehicles[GetHashKey("fladder24")] = {
    
    layout = "BF", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = false, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 13, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [1] = "double",   -- BEISPIEL: Mehrere Muster (umschaltbar)
        [4] = "double",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
        [3] = "double",    -- Frontblitzer (schnell)
        [4] = "double",    -- Frontblitzer (schnell)
        [6] = "tree"
    },

    -- Frontblitzer
    frontExtras = {
        [5] = "tree"
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [7] = "heck_aggro_a",
        [8] = "heck_aggro_b"
    },

    -- UMFELD
    sceneExtras = { 10 },

    -- MATRIX (NEU)
    --matrixExtras = { 13 }, -- Beispiel Extra 10, falls vorhanden. Sonst anpassen!

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.849996805191, z = -0.36999985575676 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = 0.81999951601028,  y = 3.1199975013733,   z = 1.8299986124039 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
	},
        [4] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = -0.81999951601028,  y = 3.1199975013733,   z = 1.8299986124039 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
	},
        [5] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.41999986767769,  y = 3.9299967288971,   z = 0.0 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 15.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.41999986767769,  y = 3.9299967288971,   z = 0.0 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 15.0,
                intensity = 2.5
            }
        },
        [6] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.81999945640564,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 10.0,
                intensity = 1.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.81999945640564,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 10.0,
                intensity = 1.5
            }
        },
        [7] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.11999992281199,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.11999992281199,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            }
        },
        [8] = {
            {
                type = "spot",
                dir = "out",
                offset    = { x = 0.47999978065491,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            },
            {
                type = "spot",
                dir = "out",
                offset    = { x = -0.47999978065491,  y = -4.4800071716309,   z = 0.44999992847443 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 2.5
            }
        },
        [10] = {
            {
                type = "point",
                offset    = { x = 0.0,  y = -4.4500064849854,  z = 0.36000001430511 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = 1.2699990272522,  y = -2.2299981117249,  z = 0.39999997615814 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = -1.2699990272522,  y = -2.2299981117249,  z = 0.39999997615814 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = 1.2699990272522,  y = 1.1599992513657,  z = 1.3599990606308 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
            {
                type = "point",
                offset    = { x = -1.2699990272522,  y = 1.1599992513657,  z = 1.3599990606308 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            },
        }
    }
}
-- Nicht ELS Fahrzeug mit drauf gespwnter Kennleuchte, Model Dateien in HM_ELSPro/stream
ELSPro.Vehicles[GetHashKey("ExampleVehicle2")] = {
    
    layout = "Test1", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    attachedProp = {
    model = "kennleuchtew",
    offset = { x=-0.550, y=-0.150, z=1.320 },
    
    -- Konfiguration für BLAU (Standard)
    extras = {
        [2] = false, -- Orange aus
        -- Extra 1 blitzt schnell (nutzt Pattern "PRE_H_FAST" aus patterns.lua)
        [1] = "v47_double_B", 
    },

    -- Konfiguration für ORANGE (wenn umgeschaltet)
    amberExtras = {
        [1] = false, -- Blau aus
        
        -- Extra 4 blitzt orange (gleichzeitiges Blitzen)
        [2] = "v47_double_B",
    }
    },

    lightExtras = {
        [1] = {"v47_double_A", "rapid", "steady"},    -- BEISPIEL: Mehrere Muster (umschaltbar)
    },

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                offset    = { x = -0.55,  y = -0.15,   z = 1.60 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
        [2] = {
            {
                type = "point",
                offset    = { x = -0.55,  y = -0.15,   z = 1.60 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
    }
}

--Polizei
ELSPro.Vehicles[GetHashKey("rhzpkw")] = {
    
    layout = "ZivilPOL", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = true, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 10, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [4] = "single"

    },

    -- Frontblitzer
    frontExtras = {
        [2] = "v47_double_C"
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [10] = "steady",
    },

    -- UMFELD
    sceneExtras = { 12 },

    -- MATRIX (NEU)
    matrixExtras = { 99 }, -- Beispiel Extra 10, falls vorhanden. Sonst anpassen!

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = 1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
        [2] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [3] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [4] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [5] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.00,  y = 2.95,   z = 0.30 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [7] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.05,  y = -4.00,   z = 2.25 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 3.0
            }
        },
        [12] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.0,  y = -0.2,  z = 1.20 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            }
        }
    }
}
ELSPro.Vehicles[GetHashKey("polizei1")] = {
    
    layout = "POL", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = true, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 10, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [1] = "double",    -- BEISPIEL: Mehrere Muster (umschaltbar)
        [3] = "double_inv",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
        [3] = "v47_double_A",    -- Frontblitzer (schnell)
        [4] = "v47_double_B",    -- Frontblitzer (schnell)
    },

    -- Frontblitzer
    frontExtras = {
        [2] = "single",
        [6] = "v47_double_C"
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [5] = "single",
        [9] = "single"
    },

    -- UMFELD
    sceneExtras = { 12 },

    -- MATRIX (NEU)
   matrixExtras = {
        [7] = "matrix",    -- BEISPIEL: Mehrere Muster (umschaltbar)
        [8] = "matrix_inv",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
    },

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_ALPHA",
        [2] = "SIREN_BRAVO",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = 1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
        [2] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [3] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [4] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [5] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.00,  y = 2.95,   z = 0.30 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [7] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.05,  y = -4.00,   z = 2.25 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 3.0
            }
        },
        [12] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.0,  y = -0.2,  z = 1.20 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            }
        }
    }
}

--Stadtwerke
ELSPro.Vehicles[GetHashKey("bfprit")] = {
    
    layout = "stadtwerke", -- Name des gespeicherten Layouts (siehe Ingame Tablet /els_config)
    
    noFlash = true, -- Wenn TRUE, wird dieses Fahrzeug nicht geblitzt (benötigt ELSPro.NoFlashOnBlueLight = true)

    -- BLAULICHT
    -- hasBeacon = true, -- Wenn TRUE, hat das Fahrzeug eine aufsetzbare Kennleuchte (via # Taste)
    -- beaconExtra = 10, -- Das Extra für die Aufsetz-Kennleuchte

    lightExtras = {
        [2] = "wigwag_a",    -- Dachbalken Rechts (blinkt jetzt korrekt abwechselnd)
        [3] = "wigwag_b",    -- Frontblitzer (schnell)
    },

    -- Frontblitzer
    frontExtras = {
        [4] = "single",
    },

    -- ORANGE / AMBER LIGHTS (Optional for Color Switch)
    -- amberExtras = {
    --     [1] = "wigwag_a",
    --     [2] = "wigwag_b"
    -- },
    -- amberFrontExtras = {
    --     [5] = "wigwag_a",
    --     [6] = "wigwag_b"
    -- },

    -- HECKWARNER
    rearExtras = {
        [7] = "single",
    },

    -- UMFELD
    sceneExtras = { 12 },

    -- MATRIX (NEU)
    matrixExtras = { 10 }, -- Beispiel Extra 10, falls vorhanden. Sonst anpassen!

    -- SIRENEN
    wmTones = {
        [1] = "SIREN_echo",
        [2] = "SIREN_CHARLIE",
        [3] = "SIREN_ALPHA"
    },



    -- SIRENEN POSITION & RICHTUNG (NEU)
    sirenOffset      = { x = 0.0, y = 3.5, z = 0.5 }, -- Beispiel: Vorne an der Stoßstange
    sirenDirectional = true,                          -- Wenn true: Richtungsabhängige Lautstärke
    sirenQuietZone   = "back",                        -- "back", "front", "left", "right" (Wo soll es leise sein?)
    sirenRange       = 500.0,                         -- (NEU) Reichweite der Sirene in Metern
    allowTrafficClear = true,                         -- (NEU) Rettungsgasse / NPCs machen Platz?
    hasMegaphone      = true,                         -- (NEU) Hat dieses Fahrzeug einen Außenlautsprecher?
    
    -- optional: EnvLights, wenn du sie nutzen willst:
    envLights = {
        [1] = {
            {
                type = "point",
                dir = "out", -- WICHTIG! Wenn hier dir = "out" steht werden die Envlights vom Script so berechnet das diese nicht ins Fahrzeug leuchten und werden automatisch in "spot" statt "point" umgewandelt, wenn nicht gewünscht, Zeile bitte löschen!
                offset    = { x = 1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            },

            -- So kannst du weitere Envlights zu den Extras hinzufügen, denk immer an das Komma an der Klamma des oberen Envlight Eintrags Beispiel= }, --

            -- {
            --    type = "point",
            --    offset    = { x = 3.0,  y = 8.0,   z = 1.0 },
            --    color     = { r = 0,    g = 0,     b = 255 },
            --    range     = 25.0,
            --    intensity = 2.5
            -- }
        },
        [2] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.15,  y = 1.65,   z = 2.15 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [3] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = -1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [4] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 1.30,  y = -4.25,   z = 2.35 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [5] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.00,  y = 2.95,   z = 0.30 },
                color     = { r = 0,    g = 0,     b = 255 },
                range     = 25.0,
                intensity = 2.5
            }
        },
        [7] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.05,  y = -4.00,   z = 2.25 },
                color     = { r = 255,  g = 150,   b = 0 },
                range     = 15.0,
                intensity = 3.0
            }
        },
        [12] = {
            {
                type = "point",
                dir = "out",
                offset    = { x = 0.0,  y = -0.2,  z = 1.20 },
                color     = { r = 255,  g = 255,   b = 255 },
                range     = 10.0,
                intensity = 3.5
            }
        }
    }
}
