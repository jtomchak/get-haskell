-- create our function with closure on the tuple
robot (name, attack, hp) = \message -> message (name, attack, hp)

--helpers
name (n, _, _) = n
attack (_, n, _) = n
hp (_, _, n) = n

shorty = robot ("shorty", 15, 100)

--get values
getRobotName bot = bot name
getRobotAttack bot = bot attack
getRobothp bot = bot hp

--set values
setName aRobot newName = aRobot (\(n,a,h) -> robot (newName,a,h))
setAttack aRobot newAttack = aRobot (\(n,a,h) -> robot (n,newAttack,h))
setHP aRobot newHP = aRobot (\(n,a,h) -> robot (n,a,newHP))

--print all robot info
printRobot bot = bot (\(n,a,h) -> n ++ " attack:" ++ (show a) ++ " hp:" ++ (show h))

--damage town to robot 
damage aRobot attackDamage = aRobot (\(n,a,h) -> robot (n,a,h-attackDamage))

--now a fight
fight aRobot defender = damage defender attack
  where attack = if getHP aRobot > 10
                 then getAttack aRobot
                 else 0