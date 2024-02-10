// Classic db_escape function for sql requests
// Deprecated: This functionality has been replaced 
// with the format specifier %q as of SA-MP 0.3.7 R2.
// https://sampwiki.blast.hk/wiki/Escaping_Strings_SQLite

stock db_escape(const text[])
{
    new ret[80 * 2], ch, i, j;
    while ((ch = text[i++]) && j < sizeof (ret))
    {
        if (ch == '\'')
        {
            if (j < sizeof (ret) - 2)
            {
                ret[j++] = '\'';
                ret[j++] = '\'';
            }
        }
        else if (j < sizeof (ret)) ret[j++] = ch;
        else j++;
    }
    ret[sizeof (ret) - 1] = '\0';
    return ret;
}