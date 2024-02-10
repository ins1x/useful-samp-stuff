Function
========

### From SA-MP Wiki
  
**Functions** are powerful little tools that allow you to move large repeated bits of code away from the main block, making it easier to edit something that is used in multiple places.

Contents
--------

*   [1 Stock](#Stock)
*   [2 Examples](#Examples)
*   [3 Creating and Using](#Creating_and_Using)
*   [4 Returning multiple values](#Returning_multiple_values)
*   [5 Optional inputs](#Optional_inputs)

### Stock

The 'stock' function modifier is a flag that tells the compiler to ignore the function or variable marked with 'stock' at compile time if it isn't used. This means that the compiled code will not have the unused data and thus use less disk space and memory. It must nonetheless be noted that there usually isn't any need to declare a function as stock within a gamemode or filterscript. You will most likely want to use that function anyway and the compiler will issue a handy warning in case you do forget to use it.

When you compile a script only the stock functions which you use in your script are saved, and any you fail to include do not appear in the compiled ".amx", thus increasing efficiency in one way or another. For example, if you have a stock function that gave the player a vehicle, but you never use it, when you go to compile the compiler wouldn't bothered including it. This makes it advantageous to have large stock libraries stored in includes, as the script will only "extract" the ones it requires upon compiling.

### Examples

Some commonly used functions include:-

*   PlayerToPoint (Deprecated. Use [IsPlayerInRangeOfPoint](/wiki/IsPlayerInRangeOfPoint "IsPlayerInRangeOfPoint") instead.)
*   Strtok (Outdated. See [sscanf](/wiki/Sscanf "Sscanf") instead.)
*   IsNumeric
*   ReturnUser (Outdated. Once again see sscanf instead.)

Functions can be any length, from a small snippet to a large piece of code with multiple if/case statements and other functions within them. You can "nest" or trigger functions from within a function if you so wish.

Below are examples of stock functions used to save the players health to a Float.
```
stock Health(playerid)
{
	new Float:HP;
	GetPlayerHealth(playerid, HP);
	return _:HP;
}

stock Float:Health(playerid)
{
	new Float:HP;
	GetPlayerHealth(playerid, HP);
	return HP;
}
```
### Creating and Using

Stock functions, as with normal functions can have numerous inputs, including strings, integers and floats. They must be properly referred to though in the stock header.

**Parameters:**

(Types)  
* String-To refer to a string, use "stringname\[\]"
* Integer-To use an integer, simply enter the variable you wish to use "number"
* Float-For floats, use "Float:name"

There are a lot of more types that can be used here (and in any other functions).

Here is an example header using all three:

```
stock Lol(string[], count, Float:cord)
{
	printf("%s, %d, %f", string, count, cord);
}
```

### Returning multiple values

Sometimes with functions, you do not wish to return a single value, but set multiple variables. For example, GetXYInFrontOfPlayer returns the X and Y values, which is not possibly by simply using return;

The easiest way to go about this without using global variables is to use the ampersand symbol "&".

The example below shows the ampersand in use.
```
GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid))
	{
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance \* floatsin(-a, degrees));
	y += (distance \* floatcos(-a, degrees));
}
```
To use this script, you would:
```
new Float:x, Float:y, Float:z;
GetPlayerPos(playerid, x, y, z);
GetXYInFrontOfPlayer(playerid, x, y, 5.0);
SetPlayerPos(playerid, x, y, z);
```
The inputs marked with "&" are the places in which values will be sent after the script has executed.

### Optional inputs

Sometimes you may want part of a stock where as other times you may not wish to include it. When this happens, you can set a default value for a variable, so the player does not get errors that say they don't have the correct number of arguments.
```
stock Freeze(playerid,on=0)
{
	switch(on)
	{
		case 0: TogglePlayerControllable(playerid,0);
		case 1: TogglePlayerControllable(playerid,1);
	}
}
```
This example is fairly pointless as it does not add any extra functionality, but it demonstrates optional inputs. To freeze a player, you can use either:

*   Freeze(playerid);
*   Freeze(playerid, 0);

But to unfreeze a player you must use

*   Freeze(playerid, 1);

When you use the stock without giving a value for "on" the stock automatically uses the value 0. If you give a value for on, it will use the one you give it.

The below example uses a boolean variable (a weak tag) to implement the same.
```
stock ToggleFreezeStatus(playerid, bool: freeze = false)
{
	TogglePlayerControllable(playerid, freeze);
}
```
It can be used in the same way as shown, with T/F values.

Retrieved from "[https://sampwiki.blast.hk/wiki/Function](https://sampwiki.blast.hk/wiki/Function)"
