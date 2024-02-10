// Returns the weapon slot by its weaponid.
// Look https://www.open.mp/docs/scripting/resources/weaponids for more information.

stock GetWeaponSlot(weaponid)
{
    switch(weaponid)
    {
       case 0, 1: return 0;
       case 2..9: return 1;
       case 10..15: return 10;
       case 16..18, 39: return 8;
       case 22..24: return 2;
       case 25..27: return 3;
       case 28, 29, 32: return 4;
       case 30, 31: return 5;
       case 33, 34: return 6;
       case 35..38: return 7;
       case 41..43: return 9;
       case 44..46: return 11;
       default: return 12; 
    }
    return 0;
}