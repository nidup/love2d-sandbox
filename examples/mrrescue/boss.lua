Boss = { DEAD_TIME = 5, DEAD_SMOKE_INTERVAL = 0.5, IDLE_TIME = 1.5 }
Boss.__index = Boss
-- Boss states
BS_IDLE,
BS_JUMP,
BS_FLY,
BS_LAND,
BS_TRANSITION,
BS_DEAD,
BS_WALK,
BS_PUSHED,
BS_SHOOT,
BS_ROLL,
BS_DAZED,
BS_TRANSFORM
= 0,1,2,3,4,5,6,7,8,9,10,11
