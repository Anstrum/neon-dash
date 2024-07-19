local testMapLevel = {}
	
	testMapLevel.x = 0
	testMapLevel.y = 0
	testMapLevel.width = 800
	testMapLevel.height = 600
	testMapLevel.colors = {
		{"wall", 1, 1, 1, 1}
	}

	testMapLevel.walls = {
		{"wall", 0, 500, 800, 100},
		{"wall", 0, 0, 30, 600},
		{"wall", 770, 0, 30, 600},
		{"wall", 170, 250, 460, 50}
	}

return testMapLevel