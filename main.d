import std.stdio;
import std.array;
import std.string;
import std.algorithm;

string[] sessvm;
string[] sessrd;
string[] sessvv;

string smush(string[] arr) {
    string memstr;
    foreach (string k; arr) {
        memstr = memstr~k~" ";
    }
    return strip(memstr);
}

void runFile(string filename) {
    File f = File(filename, "r");
    string ns;
    while (!f.eof()) {
        string line = f.readln();
        
            ns = ns~line;
    }
    run(ns);
}

void run(string code) {
    string[] stats = code.split(";");
    foreach (string stat ; stats) {
        string[] statarr = strip(stat).split(" ");
        if (statarr.length > 0) { 
            /// This is a port so no extra codes are needed.
            /// Everything is in this code block.
            /// Macros start with "!"
            /// Memory "Stuffs" start with $.
            /// DExcla macros start with "@".
            if (startsWith(statarr[0], "!")) {
                if (statarr[0] == "!print") { ///  !print <msg>
                    statarr = statarr.remove(0);
                    writeln(smush(statarr));
                } else if (statarr[0] == "!define") {
                    if (statarr.length == 2) { // Just the !define and name
                        sessrd = sessrd~statarr[1];
                    } else {
                        sessvm = sessvm~statarr[1];
                        sessvv = sessvv~statarr[2];
                    }
                } else if (statarr[0] == "!access") {
                    if (statarr.length < 4) {
                        writeln("Excla: the syntax for !access is wrong.");
                        return;
                    }
                    string vname = statarr[1];
                    string ptr = statarr[2];
                    string action = statarr[3];
                    if (ptr == "=>") {
                        if (action == "write") {
                            for (uint i = 0; i < sessvm.length; ++ i) {
                                if ( sessvm[i] == vname) {
                                    writeln(sessvv[i]);
                                }
                            }
                        }
                    }
                }
            } else if (startsWith(statarr[0], "@")) { /// @...
                if (statarr[0] == "@warn") {
                    statarr = statarr.remove(0);
                    writeln(smush("WARNING: "~statarr));
                } else if (statarr[0] == "@include") {
                    runFile(statarr[1]);
                } else if (statarr[0] == "@input") {
                    sessvm = sessvm~statarr[1];
                    sessvv = sessvv~readln();
                }
            } else {
                
                if (statarr[0] == "if") { // if MACRO is VALUE then
                    string vmac = statarr[1];
                    string iskey = strip(statarr[2]);
                    
                    string val = statarr[3];
                    string thenword = statarr[4];
                    
                    bool works = false;
                    for (uint i = 0; i < sessvm.length; ++ i) {
                                if ( sessvm[i] == vmac) {
                                    if (sessvv[i] == val) {
                                        works = true;
                                    }
                                }
                    }
                    if (works) {
                        statarr = statarr.remove(0, 1, 2, 3);
                        statarr[0] = strip(statarr[0][indexOf(statarr[0], "\n").. statarr[0].length]);
                        run(smush(statarr));
                        
                    }
                }
            }
        }
    }
}


void main() {
    runFile("sample.excla");
}