local FilterRules = {
    -- 基于标签的类型定义
    TYPE_TAGS = {
        food = {
            "food",         
            "spoiled",      
            "stale",        
            "fresh",        
            "raw",          
            "cook"          
        },
        armor = {
            "armor"         
        },
		clothes = {
            "dress",        
            "hat"          
        },
        weapon = {
            "weapon"        
        },
        tool = {
            "tool"          
        },
        material = {
            "molebait",     
            "treeseed",     
            "filter",       
            "oceanfishing", 
            "building"      
        },
        gem = {
            "gem"           
        }
    },
    
    -- 基于组件的类型定义
    TYPE_COMPONENTS = {
        food = {
            "edible",       
            "perishable"    
        },
        armor = {
            "armor"         
        },
		clothes = {
            "equippable",   
            "insulator"     
        },
        weapon = {
            "weapon",       
            "projectile"    
        },
        tool = {
            "tool",         
            "finiteuses"    
        },
        material = {
            "stackable",    
            "tradable"      
        },
        gem = {
            "repairer"      
        },		
        cooks = {     
        }
    },  
    
    -- 特殊规则
    SPECIAL_CASES = {
        -- 宝石
        ["bluegem"] = {"gem"},
        ["redgem"] = {"gem"},
        ["purplegem"] = {"gem"},
        ["greengem"] = {"gem"},
        ["orangegem"] = {"gem"},
        ["yellowgem"] = {"gem"},
        ["opalprecious"] = {"gem"},
        
        -- 特殊食物
        ["mandrake"] = {"food", "material"},
        ["wormlight"] = {"food", "material"},
        ["butter"] = {"food", "material"},
        
        -- 特殊材料
        ["livinglog"] = {"material"},
        ["dreadstone"] = {"material"},
        ["moonrocknugget"] = {"material"},
        
        -- 特殊工具
        ["diviningrod"] = {"tool"},
        ["fishingrod"] = {"tool"},
        ["hammer"] = {"tool"},
        
        -- 料理类食物
        ["meatballs"] = {"cooks"},           
        ["bonestew"] = {"cooks"},            
        ["butterflymuffin"] = {"cooks"},     
        ["frogglebunwich"] = {"cooks"},      
        ["honeyham"] = {"cooks"},            
        ["honeynuggets"] = {"cooks"},        
        ["kabobs"] = {"cooks"},              
        ["mandrakesoup"] = {"cooks"},        
        ["monsterlasagna"] = {"cooks"},      
        ["perogies"] = {"cooks"},            
        ["powcake"] = {"cooks"},             
        ["pumpkincookie"] = {"cooks"},       
        ["ratatouille"] = {"cooks"},         
        ["taffy"] = {"cooks"},               
        ["turkeydinner"] = {"cooks"},        
        ["unagi"] = {"cooks"},               
        ["waffles"] = {"cooks"},             
        ["fishsticks"] = {"cooks"},          
        ["jammypreserves"] = {"cooks"},      
        ["fruitmedley"] = {"cooks"},         
        ["fishtacos"] = {"cooks"},           
        ["flowersalad"] = {"cooks"},         
        ["icecream"] = {"cooks"},            
        ["watermelonicle"] = {"cooks"},      
        ["trailmix"] = {"cooks"},            
        ["hotchili"] = {"cooks"},            
        ["guacamole"] = {"cooks"},           
        ["surfnturf"] = {"cooks"},           
        ["californiaroll"] = {"cooks"},      
        ["vegstinger"] = {"cooks"},          
		
		
		-- 特殊衣物
		["beefalohat"] = {"clothes"},        
		["winterhat"] = {"clothes"},         
		["earmuffshat"] = {"clothes"},       
		["strawhat"] = {"clothes"},          
		["tophat"] = {"clothes"},            
		["featherhat"] = {"clothes"},        
		["beehat"] = {"clothes"},            
		["minerhat"] = {"clothes"},          
		["spiderhat"] = {"clothes"},         
		["footballhat"] = {"clothes"},       
		["reflectivevest"] = {"clothes"},    
		["hawaiianshirt"] = {"clothes"},     
		["trunkvest_summer"] = {"clothes"},  
		["trunkvest_winter"] = {"clothes"},  
		["beargervest"] = {"clothes"},       
		["raincoat"] = {"clothes"},          
		["sweatervest"] = {"clothes"},       
		["catcoonhat"] = {"clothes"},        
		["icehat"] = {"clothes"},            
		["rainhat"] = {"clothes"},           
		["bushhat"] = {"clothes"},           
		["walrushat"] = {"clothes"},         
		["slurtlehat"] = {"clothes"},        
		["ruinshat"] = {"clothes"},          
		["eyebrellahat"] = {"clothes"},      
		["watermelonhat"] = {"clothes"},     
		["deerclopseyeball"] = {"clothes"},  
		["goggleshat"] = {"clothes"},        
		["deserthat"] = {"clothes"},         
		["moonstorm_goggleshat"] = {"clothes"}, 
		["skeleton_suit"] = {"clothes"},      
		["dreadstone_suit"] = {"clothes"},   
		
		
    }
}

return FilterRules