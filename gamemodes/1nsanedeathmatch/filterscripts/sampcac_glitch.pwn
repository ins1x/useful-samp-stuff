/*
 * SA-MP Clientside Anticheat (SAMPCAC)
 * Version:         v0.10.0
 * Author:          0xCAC
 * Compatible with: SA-MP 0.3.7 Server
 * Site:            https://SAMPCAC.xyz
 * Documentation:   https://SAMPCAC.xyz/docs
 *
 *
 * Usage:           Toggle glitches status by editing "scriptfiles/sampcac_glitch.ini"
 */

#define FILTERSCRIPT

#include <a_samp>
#include <sampcac>

new const g_szGlitchKeys[][] = {"quick_reload", "fast_fire", "fast_move", "c_bug", "fast_sprint", "quick_stand"};

#if sizeof(g_szGlitchKeys) != CAC_GLITCH__ALL
	#error Your version of sampcac.inc is not compatible with this filterscript. Redownload the server package from www.SAMPCAC.xyz
#endif

public OnFilterScriptInit()
{
    new result[16], status;
    for(new i = 0; i != CAC_GLITCH__ALL; ++i)
    {
        if(getINIString("sampcac_glitch.ini", "glitch", g_szGlitchKeys[i], result))
        {
            if(!strcmp(result, "on", true, 2))
                status = 1;
            else 
                status = 0;           
        }
        else
        {
            status = 1;
            printf("  SAMPCAC: Couldn't read \"%s\" key from \"scriptfiles/sampcac_glitch.ini\"", g_szGlitchKeys[i]);
            printf("  SAMPCAC: This glitch is set as enabled by default.");
        }
        CAC_SetGlitchStatus(i, status);
    }
    printf("  SAMPCAC glitches filterscript loaded.");
    return 1;
}

// Slightly modified code from: http://wiki.sa-mp.com/wiki/How_to_read_from_INI_files
getINIString(const filename[], const section[], const item[], result[], max_size = sizeof(result)) {
    new File: inifile;
    new line[512];
    new sectionstr[64], itemstr[64];
    new sectionfound = 0;

    inifile = fopen(filename, io_read);
    if (!inifile) {
        return 0;
    }

    format(sectionstr, sizeof(sectionstr), "[%s]", section);
    format(itemstr, sizeof(itemstr), "%s=", item);

    while (fread(inifile, line)) {
        StripNewLine(line);

        if (line[0] == 0) {
            continue;
        }

        /* If !sectionfound is true, we're looking for the proper section. */
        if (!sectionfound) {
            /* Check if wanted section is being opened. */
            if (!strcmp(line, sectionstr, true, strlen(sectionstr))) {
                sectionfound = 1;
            }
        } else { /* Itemmode from here. */
            /* We're leaving the wanted section and didn't find the value yet.
             * So we'll never reach it. */
            if (line[0] == '[') {
                fclose(inifile);
                return 0;
            }

            /* Have we reached our wanted INI item? */
            if (!strcmp(line, itemstr, true, strlen(itemstr))) {
                format(result, max_size, "%s", line[strlen(itemstr)]);
                fclose(inifile);
                return 1;
            }
        }
    }

    fclose(inifile);
    return 0;
}

// http://forum.sa-mp.com/showpost.php?p=2908420&postcount=2
StripNewLine(string[])
{
    new len = strlen(string);
    if (len >= 1 && ((string[len - 1] == '\n') || (string[len - 1] == '\r'))) {
        string[len - 1] = 0;
        if (len >= 2 && ((string[len - 2] == '\n') || (string[len - 2] == '\r'))) string[len - 2] = 0;
    }
}