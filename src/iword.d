// File for handling word extractions (keywords)

string[] Reserved = [
"PRINT", "IF", "EXECUTE", "NULL", "**", "#[include]", "#[no_parse]"
];



enum RESERVED_EX {
ISYS_PRINT, ISYS_IF, ISYS_EXECUTE, ISYS_NULL, ISYS_COMMENT, ISYS_INCLUDE,
ISYS_ISO, ISYS_SYNTERROR
}

