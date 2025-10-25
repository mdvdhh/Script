# Load EightCI
```lua
local EightCI = loadstring(game:HttpGet("https://raw.githubusercontent.com/mdvdhh/Library/refs/heads/main/Test"))()
```

# Create Window
```lua
local Window = EightCI:CreateWindow({
    Title = "EightCI Ui",
})
```

# Create Button
```lua
local Button = EightCI:Button({
    Title = "Click Me",
    Callback = function()
        print("Button clicked!")
    end
})
```

# Create Toggle
```lua
local Toggle = EightCI:Toggle({
    Title = "Cool Toggle",
    Default = false,
    Callback = function(state)
        print("Toggle state:", state)
    end
```
})
