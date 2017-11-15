//: the known issue
//: * LUCK CAN't more than 100
//: * change some condition of random
//: * change some condition about special weapon/wearable
//: * take damage back if the defense more than attack

import UIKit

public class Player {
    
    /**
     * tuple of status
     * - **name**: name of this player
     * - **HP**: health point of this player
     * - **Attack**: attack point
     * - **Defense**: defense point
     * - **Luck**: the luck that effect the drop item *(MAX: 100)*
     * - **weapon**: the weapon that player wear *(MAX: HP / 2)*
     * - **wearable**: the wearable that player wear *(MAX: HP / 2)*
     * - **statusLive**: 0 is mean alive; otherwise, dead
     */
    var status: (name: String, HP: Int, Attack: Int, Defense: Int, Luck: Int, weapon: Int, wearable: Int, statusLive: Int);
    var stockWeapons: [Int];
    var stockWearables: [Int];
    
    init(name: String, HP: Int, percent: Int) {
        self.status = (name: name, HP: HP, Attack: randomPercent(percent), Defense: randomPercent(percent), Luck: randomPercent(100), weapon: 1, wearable: 1, statusLive: 0);
        // wear weapon/wearable
        self.status.Attack += self.status.weapon;
        self.status.Defense += self.status.wearable;
        // create emply array of int
        self.stockWeapons = [Int]();
        self.stockWearables = [Int]();
    }
    
    /**
     * when player attack other is valid
     * defect and decrease this.HP
     */
    func attack(otherStatus: Player) -> Bool {
        let damage = status.Attack - otherStatus.status.Defense;
        if (damage > 0) {
            otherStatus.status.HP -= damage;
            if (otherStatus.status.HP < 0) {
                otherStatus.status.HP = 0;
                otherStatus.status.statusLive = 1;
                print("\nNo More HP\n");
                return false;
            }
            return true;
        } else {
            print("Attack Fail");
            return false;
        }
    }
    
    /**
     *  when player pick some of **weapon**
     */
    func pickWeapon() {
        var weaponsList = assignWeaponsList(Double(status.HP) * (Double(status.Luck) / 100.0));
        let index = randomPercent(weaponsList.count) - 1;
        if (weaponsList[index] == 1) {
            status.Luck += Int(Double(status.Luck) * 1.0 / 15.0);
            if (status.Luck > 100) {
                status.Luck = 100;
            }
            print("----------------------");
            print("\(status.name) Special WEAPON BE PICK");
            print("----------------------");
        } else {
            stockWeapons.append(weaponsList[index]);
        }
    }
    
    /**
     *  when player pick some of **wearable**
     */
    func pickWearable() {
        var wearablesList = assignWearablesList(Double(status.HP) * (Double(status.Luck) / 100.0));
        let index = randomPercent(wearablesList.count) - 1;
        if (wearablesList[index] == 1) {
            status.Luck += Int(Double(status.Luck) * 1.0 / 10.0);
            if (status.Luck > 100) {
                status.Luck = 100;
            }
            print("------------------------");
            print("\(status.name) Special WEARABLE BE PICK");
            print("------------------------");
        } else {
            stockWearables.append(wearablesList[index]);
        }
    }
    
    /**
     *  when player want to wear some **weapon**
     */
    func wearWeapon(index: Int) -> Bool {
        // check weapon valid or not
        if (status.weapon == 0) {
            status.weapon = stockWeapons[index];
            status.Attack += stockWeapons.removeAtIndex(index);
            return true;
        } else {
            print("-----------------------------------");
            print("It's only have some weapon in there");
            print("-----------------------------------");
            return false;
        }
    }
    
    /**
     *  when player want to wear some **wearable**
     */
    func wearWearable(index: Int) -> Bool {
        // check weapon valid or not
        if (status.wearable == 0) {
            status.wearable = stockWearables[index];
            status.Defense += stockWearables.removeAtIndex(index);
            return true;
        } else {
            print("-------------------------------------");
            print("It's only have some wearable in there");
            print("-------------------------------------");
            return false;
        }
    }
    
    func unWearWeapon() {
        // check weapon available or not
        if (status.weapon != 0) {
            status.Attack -= status.weapon;
            stockWeapons.append(status.weapon);
            status.weapon = 0;
        } else {
            print("---------");
            print("No weapon");
            print("---------");
        }
    }
    
    func unWearWearable() {
        // check weapon available or not
        if (status.wearable != 0) {
            status.Defense -= status.wearable;
            stockWearables.append(status.wearable);
            status.wearable = 0;
        } else {
            print("-----------");
            print("No wearable");
            print("-----------");
        }
    }
    
    /**
     * **Debug** function that will print out all of information in this player
     */
    func printStatus() {
        
        if (status.statusLive == 0) {
            print("\n\n\"LIVE!\"");
        } else {
            print("\n\n\"DEAD!\"");
        }
        
        print("\"\(status.name)\"  HP: \(status.HP), Attack: \(status.Attack), defense: \(status.Defense). LUCK: \(status.Luck)");
        print("WEAR: 1) weapon: \(status.weapon)\n      2) wearable: \(status.wearable)");
        print("List: 1) weapon:");
        for num in stockWeapons {
            print("         \(num)");
        }
        print("      2) wearable:");
        for num in stockWearables {
            print("         \(num)");
        }
    }
}

/**
 * random number by using percent that input **(Double)**
 */
public func randomPercent(percent: Double) -> Int {
    return Int(ceil(drand48() * percent));
}

/**
 * random number by using percent that input **(Int)**
 */
public func randomPercent(percent: Int) -> Int {
    return Int(ceil(drand48() * Double(percent)));
}

/**
 * random number by using argument with in length
 */
public func randomNearly(num: Int, length: Double) -> Int {
    var newNum = num - Int(length / 2);
    newNum = num + randomPercent(length);
    return newNum;
}

/**
 * assign weapon to get pick
 */
public func assignWeaponsList(hpLeft: Double) -> [Int] {
    var weaponsList = [Int]();
    for (var i = 1; i <= Int(round(hpLeft)); i += randomPercent(5)) {
        weaponsList.append(i);
    }
    return weaponsList;
}

/**
 * assign weapon to get pick
 */
public func assignWearablesList(hpLeft: Double) -> [Int] {
    var wearablesList = [Int]();
    for (var i = 1; i <= Int(round(hpLeft)); i += randomPercent(5)) {
        wearablesList.append(i);
    }
    return wearablesList;
}

var kamontat = Player(name: "Kamontat", HP: 1000, percent: 200);
var Bitoey = Player(name: "Soraya", HP: 2500 , percent: 250);

kamontat.printStatus();
Bitoey.printStatus();
